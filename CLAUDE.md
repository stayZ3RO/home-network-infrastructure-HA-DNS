# Claude Code Instructions

Read these first:

1. `CURRENT-STATUS.md` for project state (this repo is **complete/closed out**, Project 1 of the home network lab)
2. `ROADMAP.md`
3. `LESSONS-LEARNED.md`
4. `CHANGELOG.md`
5. `docs/project-closeout.md`

## Scope

Project 1 foundation: HA DNS (Pi-hole + Keepalived VIP), recursive DNS (Unbound), monitoring/alerting (Grafana + Prometheus), Tailscale + RustDesk remote access, Proxmox-hosted core services. Stops intentionally at this foundation. Managed routing/switching, VLAN segmentation, firewall policy, and SSID-to-VLAN mapping are tracked in `home-network-managed-infrastructure-lab`, not here.

## Directories

`audit/`, `configs/`, `diagrams/`, `docs/`, `screenshots/`, `scripts/`

## Rules

- This repo is complete/closed out. Do not resume active build-out here; new network work belongs in the managed-infrastructure-lab or VLAN-segmentation follow-up repos.
- Do not commit unless explicitly instructed.
- Do not modify infrastructure from this repo. It's documentation/portfolio, not a live control surface.
- Public-safe repo: never introduce secrets, tokens, private keys, or non-public-safe IPs/hostnames.
