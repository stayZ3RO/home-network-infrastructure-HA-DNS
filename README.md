# Home Network Infrastructure Lab 🚀

![status](https://img.shields.io/badge/status-complete-brightgreen)
![project](https://img.shields.io/badge/project-HA%20DNS%20Foundation-blue)
![platform](https://img.shields.io/badge/platform-Proxmox-orange)
![dns](https://img.shields.io/badge/DNS-Pi--hole%20%2B%20Unbound-5c2d91)
![monitoring](https://img.shields.io/badge/monitoring-Grafana%20%2B%20Prometheus-f46800)
![remote access](https://img.shields.io/badge/remote%20access-Tailscale%20%2B%20RustDesk-0ea5e9)
![security](https://img.shields.io/badge/security-no%20public%20SSH-success)

> A complete home infrastructure lab documenting HA DNS, recursive DNS, monitoring, alerting, secure remote access, Proxmox-hosted core services, and operational validation.

---

## Quick Links 🔗

| Area | Link |
|---|---|
| Current Status | [CURRENT-STATUS.md](CURRENT-STATUS.md) |
| Roadmap | [ROADMAP.md](ROADMAP.md) |
| Lessons Learned | [LESSONS-LEARNED.md](LESSONS-LEARNED.md) |
| Changelog | [CHANGELOG.md](CHANGELOG.md) |
| Project Closeout | [docs/project-closeout.md](docs/project-closeout.md) |
| Documentation Hub | [docs/](docs/) |
| Architecture Diagrams | [diagrams/](diagrams/) |
| Config Examples | [configs/](configs/) |
| Screenshots | [screenshots/](screenshots/) |

---

## Project Status ✅

**Status:** Complete / Closed Out

This repository documents **Project 1** of my home infrastructure lab: a resilient home network foundation with high availability DNS, recursive DNS, monitoring, alerting, secure remote access, and Proxmox-hosted core services.

This project intentionally ends at the **core infrastructure foundation** stage.

The managed router cutover, managed switching cutover, VLAN segmentation, firewall policy, and SSID-to-VLAN mapping are being documented separately in a dedicated network segmentation project.

---

## What This Lab Built 🧱

This lab started as a home DNS control project and evolved into a production-style infrastructure foundation.

The project includes:

- 🌐 Network baseline documentation
- 🔁 ISP migration from Xfinity to AT&T Fiber
- 🧩 Centralized DNS with Pi-hole
- 🛡️ High availability DNS with Keepalived and Gravity Sync
- 🌍 Recursive DNS with Unbound
- 📊 Monitoring with Prometheus and Grafana
- 🚨 Alert routing with Alertmanager and Discord
- 🔐 Secure remote administration with Tailscale
- 🖥️ Self-hosted RustDesk remote access
- 🧱 Proxmox-hosted core services
- 🐳 Docker monitoring migration from workstation to VM
- 💾 Backup and validation evidence

---

## Final Architecture 🏗️

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

## Completed Phases 🧭

| Phase | Status | Focus |
|---|---|---|
| Phase 1 | ✅ Complete | Network control and baseline topology |
| Phase 1.5 | ✅ Complete | Xfinity to AT&T Fiber migration |
| Phase 2 | ✅ Complete | Pi-hole DNS control |
| Phase 3 | ✅ Complete | HA DNS with Keepalived, Gravity Sync, and Unbound |
| Phase 4 | ✅ Complete | Monitoring and alerting |
| Phase 5 | ✅ Complete | Tailscale secure remote access |
| Phase 6 | ✅ Complete | Proxmox, Omada Controller, and Docker monitoring migration |
| Phase 6.5 | ✅ Complete | RustDesk remote access and VM hardening |

---

## Phase Documentation 📚

| Phase | Documentation |
|---|---|
| Phase 1 — Network Control | [docs/phase-1-network-control](docs/phase-1-network-control) |
| Phase 1.5 — ISP Migration | [docs/phase-1.5-isp-migration](docs/phase-1.5-isp-migration) |
| Phase 2 — DNS Control | [docs/phase-2-dns-control](docs/phase-2-dns-control) |
| Phase 3 — High Availability DNS | [docs/phase-3-ha-dns](docs/phase-3-ha-dns) |
| Phase 4 — Monitoring & Alerting | [docs/phase-4-monitoring-alerting](docs/phase-4-monitoring-alerting) |
| Phase 5 — Tailscale Remote Access | [docs/phase-5-remote-access](docs/phase-5-remote-access) |
| Phase 6 — Proxmox, Omada & Docker Monitoring Foundation | [docs/phase-6-proxmox-monitoring-migration](docs/phase-6-proxmox-monitoring-migration) |
| Phase 6.5 — RustDesk Remote Access & VM Hardening | [docs/phase-6.5-rustdesk-remote-access](docs/phase-6.5-rustdesk-remote-access) |

---

## Architecture Diagrams 🗺️

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

> Phase 7 and Phase 8 diagrams belong in the separate network segmentation project, not this HA DNS foundation repository.

---

## Core Tools and Services 🧰

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

## Validation Highlights 🧪

| Validation Area | What Was Confirmed |
|---|---|
| DNS Control | Clients used Pi-hole for DNS resolution |
| HA DNS | VIP remained available during failover testing |
| Gravity Sync | Pi-hole configuration replicated across nodes |
| Unbound | Local recursive DNS worked on both Pi-hole nodes |
| Monitoring | Prometheus targets and Grafana dashboards loaded correctly |
| Alerting | Alertmanager sent Discord notifications |
| Remote Access | Tailscale allowed secure remote administration |
| RustDesk | LAN-based RustDesk access worked between trusted devices |
| Proxmox | Core services were moved from workstation dependency to Proxmox |
| Backups | Proxmox backups were created for key VMs/LXCs |

---

## Project Highlights

This lab demonstrates practical infrastructure engineering across:

- High availability DNS with Pi-hole, Keepalived, and Gravity Sync
- Local recursive DNS resolution with Unbound
- Monitoring and observability with Prometheus, Grafana, Node Exporter, and Blackbox Exporter
- Alert routing through Alertmanager and Discord notifications
- Secure private administration with Tailscale
- Proxmox-hosted infrastructure services
- Self-hosted RustDesk remote access
- Operational validation, failover testing, screenshots, and structured documentation

---

## Security Notes 🔐

- No public SSH port forwarding is used.
- Tailscale provides private administrative access.
- RustDesk is kept LAN-only for this project.
- Portainer Agent is kept LAN-only.
- Monitoring services are kept LAN-only.
- Discord webhook secrets are stored locally and excluded from Git.
- Screenshots are redacted where needed.
- Secrets, passwords, tokens, and private keys are not committed.

---

## What This Project Demonstrates 💼

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

## Future Work ➡️

Future routing, switching, and VLAN work is out of scope for this repository and will be documented in a separate network segmentation project.

That project will cover ER605 production routing, managed switching, Deco AP mode, VLAN segmentation, firewall policy, and network isolation.

---

## Goal 🎯

Build and document a realistic infrastructure foundation that demonstrates networking, DNS, high availability, monitoring, alerting, virtualization, secure access, and operational validation.
