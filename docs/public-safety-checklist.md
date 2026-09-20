# Public-safety checklist

This repo is public. Before committing or publishing, check:

1. **Run the scanner:** `python3 scripts/check-public-safety.py`. It fails on MAC addresses, non-private IPv4 addresses and tailnet (`100.64.0.0/10`) addresses in tracked text. It also runs in CI (`docs-check.yml`). A justified exception goes in `.public-safety-allow`.
2. **Look at every screenshot yourself.** No scanner can read an image. Open each new or changed image and check for passwords, tokens, keys, MACs, public IPs, account IDs, SSIDs, people's names (including room names), device serial numbers, and hostnames tied to a personal handle.
3. **Never use blur or pixelation over a secret.** Pixelated text can be partly recovered. Cover it with a solid opaque box. Masked password dots also reveal the length; cover them too.
4. **Deleting a file does not delete it from history.** If a secret was ever committed, rotate it first; a history rewrite is optional and does not un-leak it.
5. **Private LAN addresses** (`192.168.x.x`) are published on purpose in this repo and are not reachable from the internet. Do not publish anything that identifies a person or a credential.
