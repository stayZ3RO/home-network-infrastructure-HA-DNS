#!/usr/bin/env python3

from __future__ import annotations

import os
import re
import struct
import sys
from pathlib import Path
from urllib.parse import unquote

ROOT = Path(".").resolve()
REPORT = ROOT / "audit" / "phase-12-project1-maturity-audit.md"

EXCLUDE_DIRS = {".git", "__pycache__", ".venv", "node_modules", "audit"}
TEXT_SUFFIXES = {".md", ".yml", ".yaml", ".txt", ".sh", ".json"}
IMAGE_SUFFIXES = {".png", ".jpg", ".jpeg", ".webp"}

STALE_PATTERNS = [
    r"\bPhase 7\b",
    r"\bPhase 8\b",
    r"\bnext phase\b",
    r"\bin progress\b",
    r"\bpending\b",
    r"\bTODO\b",
    r"\bTBD\b",
    r"\bnot complete\b",
    r"192\.168\.68\.62",
    r"\bDocker Desktop\b",
    r"\bold controller\b",
]

PUBLIC_SAFETY_PATTERNS = [
    r"token",
    r"secret",
    r"password",
    r"webhook",
    r"api[_-]?key",
    r"private key",
    r"recovery code",
]

LINK_RE = re.compile(r"(!?)\[[^\]]*\]\(([^)]+)\)")

try:
    from PIL import Image, ImageStat
    PIL_AVAILABLE = True
except Exception:
    PIL_AVAILABLE = False


def rel(path: Path) -> str:
    return str(path.relative_to(ROOT))


def iter_files():
    for path in ROOT.rglob("*"):
        if any(part in EXCLUDE_DIRS for part in path.parts):
            continue
        if path.is_file():
            yield path


def read_text(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except UnicodeDecodeError:
        return path.read_text(encoding="utf-8", errors="replace")


def png_dimensions(path: Path):
    with path.open("rb") as f:
        sig = f.read(24)
    if sig[:8] != b"\x89PNG\r\n\x1a\n":
        return None
    width, height = struct.unpack(">II", sig[16:24])
    return width, height


def jpeg_dimensions(path: Path):
    with path.open("rb") as f:
        data = f.read(2)
        if data != b"\xff\xd8":
            return None
        while True:
            marker_start = f.read(1)
            if not marker_start:
                return None
            if marker_start != b"\xff":
                continue
            marker = f.read(1)
            while marker == b"\xff":
                marker = f.read(1)
            if marker in [b"\xc0", b"\xc1", b"\xc2", b"\xc3", b"\xc5", b"\xc6", b"\xc7", b"\xc9", b"\xca", b"\xcb", b"\xcd", b"\xce", b"\xcf"]:
                length = struct.unpack(">H", f.read(2))[0]
                precision = f.read(1)
                height, width = struct.unpack(">HH", f.read(4))
                return width, height
            else:
                length_bytes = f.read(2)
                if len(length_bytes) != 2:
                    return None
                length = struct.unpack(">H", length_bytes)[0]
                f.seek(length - 2, os.SEEK_CUR)


def basic_image_dimensions(path: Path):
    if path.suffix.lower() == ".png":
        return png_dimensions(path)
    if path.suffix.lower() in {".jpg", ".jpeg"}:
        return jpeg_dimensions(path)
    return None


def likely_blank_image(path: Path):
    if not PIL_AVAILABLE:
        return None

    try:
        with Image.open(path) as img:
            img = img.convert("RGB")
            stat = ImageStat.Stat(img)
            extrema = stat.extrema
            # All channels have no range.
            if all(lo == hi for lo, hi in extrema):
                return True

            # Very low variance across all channels can indicate a blank/near-blank screenshot.
            if max(stat.var) < 1:
                return True

            return False
    except Exception:
        return None


def main():
    files = list(iter_files())
    md_files = [p for p in files if p.suffix.lower() == ".md"]
    text_files = [p for p in files if p.suffix.lower() in TEXT_SUFFIXES]
    image_files = [p for p in files if p.suffix.lower() in IMAGE_SUFFIXES]

    broken_links = []
    image_links = []
    stale_hits = []
    public_safety_hits = []
    backup_temp = []
    image_issues = []
    likely_blank = []

    existing = {rel(p) for p in files}

    for path in files:
        name = path.name.lower()
        if name.endswith(".bak") or name.endswith(".tmp") or name.endswith(".orig"):
            backup_temp.append(path)

    for path in md_files:
        text = read_text(path)
        base = path.parent

        for match in LINK_RE.finditer(text):
            is_image = bool(match.group(1))
            raw_target = match.group(2).strip()

            if raw_target.startswith(("http://", "https://", "mailto:", "tel:", "#")):
                continue

            target = raw_target.split("#", 1)[0].strip()
            if not target:
                continue

            target = unquote(target)
            target_path = (base / target).resolve()

            try:
                target_rel = rel(target_path)
            except ValueError:
                broken_links.append((path, raw_target, "outside repo"))
                continue

            if not target_path.exists():
                broken_links.append((path, raw_target, "missing target"))
            elif is_image:
                image_links.append((path, target_path))

        for pattern in STALE_PATTERNS:
            for m in re.finditer(pattern, text, flags=re.IGNORECASE):
                line_no = text[:m.start()].count("\n") + 1
                line = text.splitlines()[line_no - 1].strip()
                stale_hits.append((path, line_no, pattern, line))

        for pattern in PUBLIC_SAFETY_PATTERNS:
            for m in re.finditer(pattern, text, flags=re.IGNORECASE):
                line_no = text[:m.start()].count("\n") + 1
                line = text.splitlines()[line_no - 1].strip()
                public_safety_hits.append((path, line_no, pattern, line))

    for path in image_files:
        size = path.stat().st_size
        if size == 0:
            image_issues.append((path, "zero-byte image"))
            continue

        dims = basic_image_dimensions(path)
        if path.suffix.lower() in {".png", ".jpg", ".jpeg"} and dims is None:
            image_issues.append((path, "could not read basic image dimensions"))

        blank = likely_blank_image(path)
        if blank is True:
            likely_blank.append(path)

    REPORT.parent.mkdir(parents=True, exist_ok=True)

    with REPORT.open("w", encoding="utf-8") as f:
        f.write("# Phase 12 Project 1 Maturity Audit\n\n")

        f.write("## Summary\n\n")
        f.write(f"- Total files scanned: {len(files)}\n")
        f.write(f"- Markdown files scanned: {len(md_files)}\n")
        f.write(f"- Image files scanned: {len(image_files)}\n")
        f.write(f"- Broken relative links: {len(broken_links)}\n")
        f.write(f"- Backup/temp files: {len(backup_temp)}\n")
        f.write(f"- Image issues: {len(image_issues)}\n")
        f.write(f"- Likely blank screenshots: {len(likely_blank)}\n")
        f.write(f"- Stale wording hits: {len(stale_hits)}\n")
        f.write(f"- Public-safety keyword hits: {len(public_safety_hits)}\n")
        f.write(f"- Pillow blank-image detection available: {PIL_AVAILABLE}\n\n")

        f.write("## Broken Relative Links\n\n")
        if broken_links:
            for path, target, reason in broken_links:
                f.write(f"- `{rel(path)}` -> `{target}` ({reason})\n")
        else:
            f.write("- None found.\n")

        f.write("\n## Backup / Temporary Files\n\n")
        if backup_temp:
            for path in backup_temp:
                f.write(f"- `{rel(path)}`\n")
        else:
            f.write("- None found.\n")

        f.write("\n## Image Issues\n\n")
        if image_issues:
            for path, reason in image_issues:
                f.write(f"- `{rel(path)}` — {reason}\n")
        else:
            f.write("- None found.\n")

        f.write("\n## Likely Blank Screenshots\n\n")
        if likely_blank:
            for path in likely_blank:
                f.write(f"- `{rel(path)}`\n")
        elif PIL_AVAILABLE:
            f.write("- None found.\n")
        else:
            f.write("- Skipped because Pillow is not installed.\n")

        f.write("\n## Stale Wording Hits\n\n")
        if stale_hits:
            for path, line_no, pattern, line in stale_hits:
                f.write(f"- `{rel(path)}:{line_no}` matched `{pattern}` — {line}\n")
        else:
            f.write("- None found.\n")

        f.write("\n## Public-Safety Keyword Hits\n\n")
        if public_safety_hits:
            for path, line_no, pattern, line in public_safety_hits:
                f.write(f"- `{rel(path)}:{line_no}` matched `{pattern}` — {line}\n")
        else:
            f.write("- None found.\n")

        f.write("\n## Notes\n\n")
        f.write("- This audit is read-only.\n")
        f.write("- Public-safety keyword hits are not automatically issues; review context before changing.\n")
        f.write("- Stale wording hits are not automatically issues; historical phase documentation may legitimately describe older states.\n")
        f.write("- Manual review is still required for screenshot content, redaction, and portfolio quality.\n")

    print(f"Audit written to: {rel(REPORT)}")


if __name__ == "__main__":
    main()
