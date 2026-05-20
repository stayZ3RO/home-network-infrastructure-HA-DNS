#!/usr/bin/env bash
set -euo pipefail

mkdir -p docs diagrams
NEXT_ASSET_DIR="../home-network-segmentation-lab-assets/diagrams"
mkdir -p "$NEXT_ASSET_DIR"

for f in diagrams/09-* diagrams/10-* diagrams/*phase-7* diagrams/*phase-8*; do
  if [ -e "$f" ]; then
    echo "Moving future-project diagram out of this repo: $f -> $NEXT_ASSET_DIR/"
    mv "$f" "$NEXT_ASSET_DIR/"
  fi
done

cat > README.md <<'EOF'
# Home Network Infrastructure Lab

### HA DNS, Monitoring, Alerting, Secure Remote Access, and Proxmox-Based Core Services

---

## Project Status

**Status:** Complete / Closed Out

This repository documents Project 1 of my home infrastructure lab: a resilient home network foundation with high availability DNS, recursive DNS, monitoring, alerting, secure remote access, and Proxmox-hosted core services.

This repository intentionally ends at the core infrastructure foundation stage. The managed router cutover, managed switching cutover, VLAN segmentation, firewall policy, and SSID-to-VLAN mapping are being documented separately in a dedicated network segmentation project.

---

## Project Summary

This lab started as a home DNS control project and evolved into a production-style infrastructure foundation.

The project includes:

- network baseline documentation
- ISP migration from Xfinity to AT&T Fiber
- centralized DNS with Pi-hole
- high availability DNS with Keepalived and Gravity Sync
- recursive DNS with Unbound
- monitoring with Prometheus and Grafana
- alert routing with Alertmanager and Discord
- secure remote administration with Tailscale
- self-hosted RustDesk remote access
- Proxmox-hosted core services
- Docker monitoring migration from workstation to VM
- backup and validation evidence

---

## Final Project 1 Architecture

### Network and DNS Path

```text
Internet
  ↓
AT&T Fiber / ONT
  ↓
AT&T Gateway / IP Passthrough
  ↓
Deco Mesh Router
  ↓
Clients
  ↓
Pi-hole HA VIP - 192.168.68.20
  ↓
Active Pi-hole Node
  ↓
Local Unbound Recursive Resolver
```

### Proxmox Service Layer

```text
Proxmox Host - 192.168.68.80
├── Omada Controller LXC - 192.168.68.10
├── Docker Monitoring VM - 192.168.68.81
│   ├── Grafana
│   ├── Prometheus
│   ├── Alertmanager
│   ├── Blackbox Exporter
│   └── Portainer Agent
└── RustDesk Server VM - 192.168.68.83
    ├── rustdesk-hbbs
    └── rustdesk-hbbr
```

### Remote Administration

```text
Admin Laptop / Phone
  ↓
Tailscale
  ↓
Proxmox / Pi-hole Nodes / Monitoring Services

Trusted Devices
  ↓
RustDesk Client
  ↓
Self-hosted RustDesk Server
```

---

## Completed Phases

| Phase | Status | Focus |
|---|---|---|
| Phase 1 | Complete | Network control and baseline topology |
| Phase 1.5 | Complete | Xfinity to AT&T Fiber migration |
| Phase 2 | Complete | Pi-hole DNS control |
| Phase 3 | Complete | HA DNS with Keepalived, Gravity Sync, and Unbound |
| Phase 4 | Complete | Monitoring and alerting |
| Phase 5 | Complete | Tailscale secure remote access |
| Phase 6 | Complete | Proxmox, Omada Controller, and Docker monitoring migration |
| Phase 6.5 | Complete | RustDesk remote access and VM hardening |

---

## Documentation

| Area | Link |
|---|---|
| Current Status | [CURRENT-STATUS.md](CURRENT-STATUS.md) |
| Roadmap | [ROADMAP.md](ROADMAP.md) |
| Changelog | [CHANGELOG.md](CHANGELOG.md) |
| Lessons Learned | [LESSONS-LEARNED.md](LESSONS-LEARNED.md) |
| Project Closeout | [docs/project-closeout.md](docs/project-closeout.md) |
| Architecture Diagrams | [diagrams/README.md](diagrams/README.md) |

---

## Phase Documentation

| Phase | Documentation |
|---|---|
| Phase 1 — Network Control | [docs/phase-1-network-control](docs/phase-1-network-control) |
| Phase 1.5 — ISP Migration | [docs/phase-1.5-isp-migration](docs/phase-1.5-isp-migration) |
| Phase 2 — DNS Control | [docs/phase-2-dns-control](docs/phase-2-dns-control) |
| Phase 3 — High Availability DNS | [docs/phase-3-ha-dns](docs/phase-3-ha-dns) |
| Phase 4 — Monitoring & Alerting | [docs/phase-4-monitoring-alerting](docs/phase-4-monitoring-alerting) |
| Phase 5 — Tailscale Remote Access | [docs/phase-5-tailscale-remote-access](docs/phase-5-tailscale-remote-access) |
| Phase 6 — Proxmox, Omada & Docker Monitoring Foundation | [docs/phase-6-proxmox-omada-foundation](docs/phase-6-proxmox-omada-foundation) |
| Phase 6.5 — RustDesk Remote Access & VM Hardening | [docs/phase-6.5-rustdesk-remote-access](docs/phase-6.5-rustdesk-remote-access) |

---

## Architecture Diagrams

| Phase | Diagram |
|---|---|
| Phase 1 — Previous Network / Xfinity | [01-phase-1-previous-network-xfinity.png](diagrams/01-phase-1-previous-network-xfinity.png) |
| Phase 1.5 — ISP Migration / AT&T Fiber | [02-phase-1-5-isp-migration-att.png](diagrams/02-phase-1-5-isp-migration-att.png) |
| Phase 2 — DNS Control | [03-phase-2-dns-control.png](diagrams/03-phase-2-dns-control.png) |
| Phase 3 — High Availability DNS | [04-phase-3-ha-dns.png](diagrams/04-phase-3-ha-dns.png) |
| Phase 4 — Monitoring & Alerting | [05-phase-4-monitoring-alerting.png](diagrams/05-phase-4-monitoring-alerting.png) |
| Phase 5 — Tailscale Remote Access | [06-phase-5-remote-access-tailscale.png](diagrams/06-phase-5-remote-access-tailscale.png) |
| Phase 6 — Proxmox Service Migration | [07-phase-6-proxmox-service-migration.png](diagrams/07-phase-6-proxmox-service-migration.png) |
| Phase 6.5 — RustDesk on Proxmox | [08-phase-6-5-rustdesk-proxmox.png](diagrams/08-phase-6-5-rustdesk-proxmox.png) |

---

## Core Tools and Services

| Tool / Service | Purpose |
|---|---|
| Pi-hole | DNS filtering and query visibility |
| Gravity Sync | Pi-hole configuration replication |
| Keepalived | HA DNS virtual IP failover |
| Unbound | Local recursive DNS resolution |
| Prometheus | Metrics collection |
| Grafana | Monitoring dashboards |
| Alertmanager | Alert routing |
| Blackbox Exporter | Endpoint and DNS probing |
| Node Exporter | Host metrics |
| Discord Webhooks | Alert delivery |
| Tailscale | Private remote administration |
| Proxmox | Virtualization platform |
| Docker Compose | Container deployment |
| RustDesk | Self-hosted remote access |
| Portainer Agent | Future centralized Docker management endpoint |

---

## Security Notes

- No public SSH port forwarding is used.
- Tailscale provides private administrative access.
- RustDesk is kept LAN-only for this project.
- Portainer Agent is kept LAN-only.
- Monitoring services are kept LAN-only.
- Discord webhook secrets are stored locally and excluded from Git.
- Screenshots are redacted where needed.
- Secrets, passwords, tokens, and private keys are not committed.

---

## What This Project Demonstrates

- Network architecture planning
- ISP migration troubleshooting
- DNS control and filtering
- High availability service design
- Recursive DNS implementation
- Failover validation
- Monitoring and alerting
- Secret handling
- Secure remote administration
- Proxmox virtualization
- Docker service migration
- Infrastructure backup validation
- Documentation and screenshot-based proof of work

---

## Future Work

Future routing, switching, and VLAN work is out of scope for this repository and will be documented in a separate network segmentation project.

That project will cover ER605 production routing, managed switching, Deco AP mode, VLAN segmentation, firewall policy, and network isolation.

---

## Goal

Build and document a realistic infrastructure foundation that demonstrates networking, DNS, high availability, monitoring, alerting, virtualization, secure access, and operational validation.
EOF

cat > ROADMAP.md <<'EOF'
# Roadmap

## Project 1 Status

**Complete / Closed Out**

This roadmap documents the completed scope of the HA DNS and core infrastructure foundation project.

Future managed routing, switching, and VLAN segmentation work is intentionally moved to a separate repository.

---

## Completed Phase Timeline

| Phase | Status | Focus |
|---|---|---|
| Phase 1 — Network Control | Complete | Baseline home network control and topology |
| Phase 1.5 — ISP Migration | Complete | Xfinity to AT&T Fiber migration |
| Phase 2 — DNS Control | Complete | Centralized DNS with Pi-hole |
| Phase 3 — High Availability DNS | Complete | Keepalived, Gravity Sync, and Unbound |
| Phase 4 — Monitoring & Alerting | Complete | Prometheus, Grafana, Alertmanager, Discord alerts |
| Phase 5 — Tailscale Remote Access | Complete | Private remote administration |
| Phase 6 — Proxmox, Omada & Docker Monitoring | Complete | Virtualization and service hosting foundation |
| Phase 6.5 — RustDesk Remote Access & VM Hardening | Complete | RustDesk, SSH hardening, Docker retention, Portainer Agent, backups |

---

## Completed Capabilities

- network baseline documentation
- ISP migration and IP Passthrough documentation
- Pi-hole DNS control
- HA DNS VIP failover
- Gravity Sync replication
- Unbound recursive DNS
- Prometheus metrics collection
- Grafana dashboards
- Alertmanager routing
- Discord alert delivery
- Tailscale private remote access
- Proxmox-hosted services
- Docker monitoring migration
- RustDesk remote access
- Docker log rotation
- Prometheus retention limits
- Proxmox backups

---

## Moved to Separate Project

The following work is intentionally not tracked as active work in this repository:

- ER605 production router cutover
- managed switch production cutover
- Deco AP mode migration
- VLAN segmentation
- inter-VLAN firewall rules
- trusted / lab / IoT / guest network isolation
- SSID-to-VLAN mapping with Omada EAPs

The next repository should focus on network segmentation and policy enforcement.

---

## Closure Decision

This repository closes at the infrastructure foundation layer so it remains focused and reviewable.

The next project builds on top of this foundation instead of extending this repository into a broader networking, segmentation, and firewall-policy project.
EOF

cat > CURRENT-STATUS.md <<'EOF'
# Current Project Status

## Status

**Complete / Closed Out**

This repository is complete as Project 1: a home network infrastructure foundation focused on HA DNS, recursive DNS, monitoring, alerting, secure remote access, and Proxmox-hosted core services.

Future managed routing, switching, VLAN segmentation, firewall policy, and SSID-to-VLAN mapping are being documented separately.

---

## Completed Project Scope

| Area | Status |
|---|---|
| Network baseline documentation | Complete |
| ISP migration documentation | Complete |
| Pi-hole DNS control | Complete |
| HA DNS with Keepalived VIP | Complete |
| Gravity Sync replication | Complete |
| Unbound recursive DNS | Complete |
| Monitoring with Prometheus and Grafana | Complete |
| Alerting with Alertmanager and Discord | Complete |
| Secure remote access with Tailscale | Complete |
| Proxmox infrastructure host | Complete |
| Omada Controller LXC | Complete |
| Docker monitoring VM | Complete |
| Portainer Agent on monitoring VM | Complete |
| RustDesk self-hosted remote access | Complete |
| VM hardening and backup validation | Complete |

---

## Final Service Layout

```text
Proxmox Host - 192.168.68.80
├── Omada Controller LXC - 192.168.68.10
├── Docker Monitoring VM - 192.168.68.81
└── RustDesk Server VM - 192.168.68.83

HA DNS
├── VIP - 192.168.68.20
├── ashpi-1 - 192.168.68.60
└── ashpi-2 - 192.168.68.61
```

---

## Completed Phase Structure

| Phase | Status | Focus |
|---|---|---|
| Phase 1 | Complete | Network control |
| Phase 1.5 | Complete | ISP migration |
| Phase 2 | Complete | DNS control |
| Phase 3 | Complete | HA DNS |
| Phase 4 | Complete | Monitoring and alerting |
| Phase 5 | Complete | Tailscale remote access |
| Phase 6 | Complete | Proxmox and service migration |
| Phase 6.5 | Complete | RustDesk and VM hardening |

---

## Documentation Links

- [README](README.md)
- [Roadmap](ROADMAP.md)
- [Changelog](CHANGELOG.md)
- [Lessons Learned](LESSONS-LEARNED.md)
- [Project Closeout](docs/project-closeout.md)
- [Architecture Diagrams](diagrams/README.md)

---

## Separate Project Scope

The following work is intentionally outside this repository:

- ER605 live router cutover
- managed switch production cutover
- Deco AP mode migration
- VLAN segmentation
- inter-VLAN firewall policy
- trusted / lab / IoT / guest isolation
- SSID-to-VLAN mapping

This keeps Project 1 focused on the HA DNS and infrastructure foundation.
EOF

cat > docs/project-closeout.md <<'EOF'
# Project Closeout — HA DNS & Core Infrastructure Foundation

## Summary

This repository is complete as the first major home infrastructure project.

It documents a resilient foundation for DNS, monitoring, alerting, secure remote access, virtualization, and service hosting.

---

## Completed Capabilities

- Network baseline and ISP migration documentation
- Pi-hole DNS filtering and query visibility
- Dual-node HA DNS with Keepalived VIP failover
- Gravity Sync replication between Pi-hole nodes
- Local recursive DNS with Unbound
- Prometheus and Grafana monitoring
- Alertmanager alert routing
- Discord alert delivery
- Tailscale secure remote administration
- Proxmox infrastructure host
- Omada Controller LXC
- Docker monitoring VM
- Monitoring migration from gaming PC to Linux VM
- RustDesk self-hosted remote access
- Docker log rotation
- Prometheus retention controls
- Portainer Agent preparation
- Proxmox backup validation

---

## Final Project 1 State

```text
AT&T Fiber / ONT
  ↓
AT&T Gateway with IP Passthrough
  ↓
Deco Mesh Router
  ↓
Home LAN - 192.168.68.0/24
  ├── HA DNS VIP - 192.168.68.20
  ├── ashpi-1 - 192.168.68.60
  ├── ashpi-2 - 192.168.68.61
  ├── Proxmox Host - 192.168.68.80
  ├── Docker Monitoring VM - 192.168.68.81
  ├── RustDesk Server VM - 192.168.68.83
  └── Omada Controller LXC - 192.168.68.10
```

---

## Why The Project Ends Here

The HA DNS and infrastructure foundation are complete.

The next logical step is a managed routing, switching, and VLAN segmentation project. That work changes the network architecture enough that it should be documented in a dedicated repository.

---

## Moved to Separate Project

The next project will cover:

- ER605 live router cutover
- managed switch as the core switch
- Deco AP mode migration
- VLAN segmentation
- inter-VLAN firewall policy
- trusted, lab, IoT, and guest isolation
- optional Omada EAP SSID-to-VLAN mapping

---

## Final Result

This project demonstrates practical infrastructure work across networking, Linux, DNS, monitoring, alerting, virtualization, secure access, documentation, and operational validation.
EOF

cat > diagrams/README.md <<'EOF'
# Architecture Diagrams

This folder contains the architecture diagrams for the completed Home Network Infrastructure Lab.

The diagrams document the Project 1 progression from baseline network control to HA DNS, monitoring, secure remote access, and Proxmox-hosted core services.

---

## Diagram Index

| Phase | Diagram | Purpose |
|---|---|---|
| Phase 1 | [01-phase-1-previous-network-xfinity.png](01-phase-1-previous-network-xfinity.png) | Original Xfinity baseline |
| Phase 1.5 | [02-phase-1-5-isp-migration-att.png](02-phase-1-5-isp-migration-att.png) | AT&T Fiber / IP Passthrough migration |
| Phase 2 | [03-phase-2-dns-control.png](03-phase-2-dns-control.png) | Centralized Pi-hole DNS |
| Phase 3 | [04-phase-3-ha-dns.png](04-phase-3-ha-dns.png) | HA DNS with Keepalived, Gravity Sync, and Unbound |
| Phase 4 | [05-phase-4-monitoring-alerting.png](05-phase-4-monitoring-alerting.png) | Prometheus, Grafana, Alertmanager, Blackbox |
| Phase 5 | [06-phase-5-remote-access-tailscale.png](06-phase-5-remote-access-tailscale.png) | Tailscale private remote access |
| Phase 6 | [07-phase-6-proxmox-service-migration.png](07-phase-6-proxmox-service-migration.png) | Proxmox and service migration |
| Phase 6.5 | [08-phase-6-5-rustdesk-proxmox.png](08-phase-6-5-rustdesk-proxmox.png) | RustDesk remote access and VM hardening |

---

## Keep In This Repository

Keep diagrams that explain the completed HA DNS and core infrastructure foundation:

- Phase 1 network baseline
- Phase 1.5 ISP migration
- Phase 2 DNS control
- Phase 3 HA DNS
- Phase 4 monitoring and alerting
- Phase 5 secure remote access
- Phase 6 Proxmox and monitoring migration
- Phase 6.5 RustDesk remote access

---

## Move To Separate Network Segmentation Project

Do not keep Phase 7 or Phase 8 diagrams in this repository.

Move these to the next project instead:

- managed router and switch cutover
- ER605 as active router/firewall
- managed switch as core switch
- Deco AP mode migration
- VLAN segmentation
- inter-VLAN firewall policy
- SSID-to-VLAN mapping

---

## Diagram Scope

These diagrams are evidence of project progression and service architecture. They are not intended to represent the future VLAN segmentation design.
EOF

echo
echo "== Verifying diagrams folder =="
find diagrams -maxdepth 1 -type f | sort

echo
echo "== Checking for Phase 7 / Phase 8 diagrams still inside repo =="
if find diagrams -maxdepth 1 -type f \( -iname '*phase-7*' -o -iname '*phase-8*' -o -iname '09-*' -o -iname '10-*' \) | grep .; then
  echo "Future-project diagrams still found in diagrams/. Move them before publishing."
  exit 1
else
  echo "No Phase 7/8 diagrams found in this repo."
fi

echo
echo "== Checking README for suggested next repo title block =="
if grep -Rni "Suggested next repo title" README.md ROADMAP.md CURRENT-STATUS.md docs/project-closeout.md diagrams/README.md; then
  echo "Remove suggested next repo title wording before publishing."
  exit 1
else
  echo "No suggested-next-repo-title block found."
fi

echo
echo "== Checking key Markdown links =="
python3 - <<'PY'
from pathlib import Path
import re
files = [
    Path("README.md"),
    Path("ROADMAP.md"),
    Path("CURRENT-STATUS.md"),
    Path("docs/project-closeout.md"),
    Path("diagrams/README.md"),
]
missing = []
for f in files:
    text = f.read_text(encoding="utf-8")
    for m in re.finditer(r'\[[^\]]+\]\(([^)]+)\)', text):
        target = m.group(1)
        if target.startswith(("http://", "https://", "#", "mailto:")):
            continue
        path = (f.parent / target)
        if not path.exists():
            missing.append((str(f), target))
if missing:
    print("Missing links:")
    for file, target in missing:
        print(f" - {file} -> {target}")
    raise SystemExit(1)
print("Markdown link check passed.")
PY

echo
echo "== Checking Phase 7/8 wording =="
grep -RniE "Phase 7|Phase 8" README.md ROADMAP.md CURRENT-STATUS.md docs/project-closeout.md diagrams/README.md || echo "No Phase 7/8 wording found."

echo
echo "Final Project 1 scope cleanup complete."
echo "If any Phase 7/8 wording appears above, it should only be in the context of being moved out of this repo."
echo "Future-project diagrams, if found, were moved to: $NEXT_ASSET_DIR"
