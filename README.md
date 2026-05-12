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
