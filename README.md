# Home Network Infrastructure Lab 🚀

### HA DNS, Monitoring, Alerting, Secure Remote Access, and Proxmox-Based Core Services

---

## 📌 Project Status

**Status: Complete / Closed Out**

This repository documents Project 1 of my home infrastructure lab: building a resilient home network foundation with high availability DNS, recursive DNS, monitoring, alerting, secure remote access, and Proxmox-hosted core services.

Future work involving the ER605 live cutover, managed switch production cutover, VLAN segmentation, firewall policy, and SSID-to-VLAN mapping will be handled in a separate network segmentation project/repository.

---

## 🧠 About This Project

This project started as a home DNS and network-control lab, then evolved into a production-style infrastructure foundation.

Instead of relying only on ISP-managed networking, I built and documented a layered environment that includes:

- network control and ISP migration
- centralized DNS with Pi-hole
- high availability DNS with Keepalived and Gravity Sync
- local recursive DNS with Unbound
- monitoring with Prometheus and Grafana
- alert routing with Alertmanager and Discord
- secure remote administration with Tailscale
- self-hosted RustDesk remote access
- Proxmox-hosted infrastructure services
- Docker monitoring migration from workstation to VM
- validation, screenshots, and GitHub-based documentation

---

## 🏗️ Final Architecture Overview

### Core DNS Path

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

### Monitoring and Alerting Path

```text
Node Exporter / Blackbox Exporter
  ↓
Prometheus
  ↓
Grafana Dashboards
  ↓
Alertmanager
  ↓
Discord Alerts
```

### Remote Administration Path

```text
Laptop / Phone / Admin Endpoint
  ↓
Tailscale Tailnet
  ↓
Proxmox / Raspberry Pi Nodes / Core Services

RustDesk Clients
  ↓
Self-hosted RustDesk Server
  ↓
Trusted LAN Remote Access
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

---

## ✅ Completed Phases

| Phase | Status | Focus |
|---|---|---|
| Phase 1 | ✅ Complete | Network control and baseline topology |
| Phase 1.5 | ✅ Complete | Xfinity to AT&T Fiber migration |
| Phase 2 | ✅ Complete | Pi-hole DNS control |
| Phase 3 | ✅ Complete | HA DNS with Keepalived, Gravity Sync, and Unbound |
| Phase 4 | ✅ Complete | Monitoring and alerting |
| Phase 5 | ✅ Complete | Tailscale secure remote access |
| Phase 6 | ✅ Complete | Proxmox, Omada Controller, Docker monitoring migration |
| Phase 6.5 | ✅ Complete | RustDesk remote access and VM hardening |

---

## 📚 Documentation

### Phase 1 — Network Control

- [Overview](docs/phase-1-network-control/overview.md)
- [Step-by-Step Guide](docs/phase-1-network-control/step-by-step.md)

### Phase 1.5 — ISP Migration

- [Overview](docs/phase-1.5-isp-migration/overview.md)
- [Step-by-Step Guide](docs/phase-1.5-isp-migration/step-by-step.md)

### Phase 2 — DNS Control

- [Overview](docs/phase-2-dns-control/overview.md)
- [Step-by-Step Guide](docs/phase-2-dns-control/step-by-step.md)

### Phase 3 — High Availability DNS

- [Overview](docs/phase-3-ha-dns/overview.md)
- [Step-by-Step Guide](docs/phase-3-ha-dns/step-by-step.md)
- [Jump Box Access](docs/phase-3-ha-dns/jump-box-access.md)
- [Validation and Failover Tests](docs/phase-3-ha-dns/validation-and-failover-tests.md)
- [Diagrams](docs/phase-3-ha-dns/diagrams.md)
- [DNS Recursion with Unbound](docs/phase-3-ha-dns/DNS-recursion-unbound.md)

### Phase 4 — Monitoring & Alerting

- [Overview](docs/phase-4-monitoring-alerting/overview.md)
- [Step-by-Step Guide](docs/phase-4-monitoring-alerting/step-by-step.md)
- [Dashboards](docs/phase-4-monitoring-alerting/dashboards.md)
- [Alerting](docs/phase-4-monitoring-alerting/alerting.md)
- [Validation](docs/phase-4-monitoring-alerting/validation.md)

### Phase 5 — Tailscale Remote Access

- [Overview](docs/phase-5-tailscale-remote-access/overview.md)
- [Step-by-Step Guide](docs/phase-5-tailscale-remote-access/step-by-step.md)
- [Validation](docs/phase-5-tailscale-remote-access/validation.md)

### Phase 6 — Proxmox, Omada & Docker Monitoring Foundation

- [README](docs/phase-6-proxmox-omada-foundation/README.md)
- [Overview](docs/phase-6-proxmox-omada-foundation/overview.md)
- [Step-by-Step Guide](docs/phase-6-proxmox-omada-foundation/step-by-step.md)
- [Validation](docs/phase-6-proxmox-omada-foundation/validation.md)
- [Diagrams](docs/phase-6-proxmox-omada-foundation/diagrams.md)
- [Managed Switch Pre-Staging](docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md)

### Phase 6.5 — RustDesk Remote Access & VM Hardening

- [README](docs/phase-6.5-rustdesk-remote-access/README.md)
- [Overview](docs/phase-6.5-rustdesk-remote-access/overview.md)
- [Step-by-Step Guide](docs/phase-6.5-rustdesk-remote-access/step-by-step.md)
- [Validation](docs/phase-6.5-rustdesk-remote-access/validation.md)
- [Diagrams](docs/phase-6.5-rustdesk-remote-access/diagrams.md)

### Project Closeout

- [Current Status](CURRENT-STATUS.md)
- [Roadmap](ROADMAP.md)
- [Changelog](CHANGELOG.md)
- [Lessons Learned](LESSONS-LEARNED.md)
- [Project Closeout](docs/project-closeout.md)

---

## 🖼️ Architecture Diagrams

- [Phase 1 — Previous Network / Xfinity](diagrams/01-phase-1-previous-network-xfinity.png)
- [Phase 1.5 — ISP Migration / AT&T Fiber](diagrams/02-phase-1-5-isp-migration-att.png)
- [Phase 2 — DNS Control](diagrams/03-phase-2-dns-control.png)
- [Phase 3 — High Availability DNS](diagrams/04-phase-3-ha-dns.png)
- [Phase 4 — Monitoring & Alerting](diagrams/05-phase-4-monitoring-alerting.png)
- [Phase 5 — Tailscale Remote Access](diagrams/06-phase-5-tailscale-remote-access-tailscale.png)
- [Phase 6 — Proxmox & Service Migration](diagrams/07-phase-6-proxmox-service-migration.png)
- [Phase 6.5 — RustDesk on Proxmox](diagrams/08-phase-6-5-rustdesk-proxmox.png)

> The ER605 cutover, production managed switching, VLAN segmentation, and SSID-to-VLAN work are intentionally excluded from this repository and will be tracked in a separate network segmentation project.

---

## 🧰 Hardware and Lab Systems

- AT&T Fiber connection
- ONT / Optical Network Terminal
- AT&T Gateway with IP Passthrough
- TP-Link Deco X25 Mesh System
- Raspberry Pi 3B+ — `ashpi-1`
- Raspberry Pi 3B — `ashpi-2`
- Dell OptiPlex Proxmox host
- Docker monitoring VM
- RustDesk Server VM
- Gaming PC / admin endpoint
- Laptop / remote admin and test endpoint

---

## 🧪 Core Tools and Services

| Tool / Service | Purpose |
|---|---|
| Pi-hole | DNS filtering and visibility |
| Gravity Sync | Pi-hole configuration replication |
| Keepalived | VIP failover for HA DNS |
| Unbound | Local recursive DNS resolution |
| Prometheus | Metrics collection |
| Grafana | Dashboard visualization |
| Alertmanager | Alert routing |
| Blackbox Exporter | Service probing |
| Node Exporter | Host metrics |
| Discord Webhooks | Alert notification delivery |
| Tailscale | Secure remote administration |
| Proxmox | Virtualization platform |
| Docker Compose | Container orchestration |
| RustDesk | Self-hosted remote access |
| Portainer Agent | Future centralized Docker management |

---

## 🔐 Security Notes

- No public SSH port forwarding is used.
- Tailscale provides private administrative access.
- RustDesk is kept LAN-only for this project.
- Portainer Agent is kept LAN-only.
- Monitoring services are kept LAN-only.
- Discord webhook secrets are stored locally and excluded from Git.
- Screenshots are redacted where needed.
- This repository avoids committing secrets, tokens, passwords, and private keys.

---

## 💼 What This Project Demonstrates

- Network architecture planning
- ISP migration troubleshooting
- DNS control and filtering
- High availability service design
- Failover validation
- Recursive DNS implementation
- Observability and alerting
- Secret handling
- Secure remote administration
- Proxmox virtualization
- Docker service migration
- Infrastructure backup validation
- Documentation and screenshot-based proof of work

---

## ➡️ Future Work

The next major project is a separate repository focused on:

- ER605 live router cutover
- Managed switch as core switch
- Deco AP mode migration
- VLAN segmentation
- Inter-VLAN firewall policy
- Trusted, lab, IoT, and guest network isolation
- Future Omada EAP SSID-to-VLAN mapping

Suggested next repo title:

```text
Home Network Segmentation Lab — ER605, Managed Switching & VLAN Isolation
```

---

## 🎯 Goal

To build and document a realistic infrastructure foundation that demonstrates networking, DNS, high availability, monitoring, alerting, virtualization, secure access, and operational validation.
