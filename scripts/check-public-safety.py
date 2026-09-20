#!/usr/bin/env python3
"""Fail on things that must not appear in a public repo.

Checks tracked text files for MAC addresses and non-private IPv4 addresses, and
lists image files that need a human to look at them (a scanner cannot read a
screenshot). Known false positives go in .public-safety-allow, one exact match
per line ("path:value" or just "value").

Usage: scripts/check-public-safety.py [--images-since GIT_REF]
Exit 0 = clean, 1 = findings.
"""
import ipaddress, re, subprocess, sys
from pathlib import Path

TEXT_SKIP = {".png", ".jpg", ".jpeg", ".gif", ".webp", ".pdf", ".ico", ".woff", ".woff2", ".zip"}
IMAGE_EXT = {".png", ".jpg", ".jpeg", ".gif", ".webp"}
MAC = re.compile(r"(?<![0-9A-Fa-f:.-])(?:[0-9A-Fa-f]{2}[:-]){5}[0-9A-Fa-f]{2}(?![0-9A-Fa-f:-])")
IPV4 = re.compile(r"(?<![\w.])(\d{1,3}(?:\.\d{1,3}){3})(?![\w]|\.\d)")
PLACEHOLDER_MACS = {"aa:bb:cc:dd:ee:ff", "00:00:00:00:00:00", "ff:ff:ff:ff:ff:ff", "xx:xx:xx:xx:xx:xx"}
DOC_NETS = [ipaddress.ip_network(n) for n in ("192.0.2.0/24", "198.51.100.0/24", "203.0.113.0/24")]
CGNAT = ipaddress.ip_network("100.64.0.0/10")
# Well-known public resolvers that appear in DNS documentation; they identify nobody.
# 100.64.0.0 is the CGNAT network address used when documenting the tailnet range, not a host.
KNOWN_PUBLIC = {"100.64.0.0", "1.1.1.1", "1.0.0.1", "8.8.8.8", "8.8.4.4", "9.9.9.9", "149.112.112.112", "208.67.222.222", "208.67.220.220"}

def tracked_files():
    out = subprocess.check_output(["git", "ls-files", "-z"], text=True)
    return [Path(p) for p in out.split("\0") if p]

def load_allow():
    p = Path(".public-safety-allow")
    return {l.strip() for l in p.read_text().splitlines() if l.strip() and not l.startswith("#")} if p.exists() else set()

def classify(ip_text):
    if ip_text in KNOWN_PUBLIC:
        return None
    try:
        ip = ipaddress.ip_address(ip_text)
    except ValueError:
        return None
    if any(ip in n for n in DOC_NETS) or ip.is_unspecified or ip.is_multicast:
        return None
    if ip in CGNAT:
        return "tailnet address (identifies a device)"
    if ip.is_private or ip.is_loopback or ip.is_link_local:
        return None
    return "public IPv4 address"

def main():
    allow = load_allow()
    findings, images = [], []
    for path in tracked_files():
        if path.suffix.lower() in IMAGE_EXT:
            images.append(path)
        if path.suffix.lower() in TEXT_SKIP or not path.is_file():
            continue
        try:
            text = path.read_text(errors="ignore")
        except OSError:
            continue
        for n, line in enumerate(text.splitlines(), 1):
            for m in MAC.finditer(line):
                v = m.group(0)
                if v.lower() in PLACEHOLDER_MACS or v in allow or f"{path}:{v}" in allow:
                    continue
                findings.append((path, n, "MAC address", v))
            for m in IPV4.finditer(line):
                v = m.group(1)
                kind = classify(v)
                if kind and v not in allow and f"{path}:{v}" not in allow:
                    findings.append((path, n, kind, v))
    for path, n, kind, v in findings:
        print(f"::error file={path},line={n}::{kind} found (value hidden in the log)")
        print(f"FINDING {path}:{n}: {kind}")
    if images:
        print(f"\nREVIEW BY EYE: {len(images)} tracked image file(s). A scanner cannot read screenshots; "
              "before publishing any new or changed image, open it and check for passwords, tokens, MACs, "
              "public IPs, SSIDs, names, device serials, and blurred or pixelated areas over secrets "
              "(pixelation is not redaction; use a solid box).")
    if findings:
        print(f"\n{len(findings)} finding(s). Fix them, or add a justified line to .public-safety-allow.")
        return 1
    print("public-safety: no MAC addresses, public IPs or tailnet addresses in tracked text files.")
    return 0

if __name__ == "__main__":
    sys.exit(main())
