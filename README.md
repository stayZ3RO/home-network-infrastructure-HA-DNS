# Home Network Infrastructure Lab 🚀

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![Project](https://img.shields.io/badge/project-home%20network%20infrastructure-blue)
![DNS](https://img.shields.io/badge/dns-Pi--hole%20HA-success)
![Monitoring](https://img.shields.io/badge/monitoring-Prometheus%20%2B%20Grafana-orange)
![Remote Access](https://img.shields.io/badge/remote_access-Tailscale-purple)
![Platform](https://img.shields.io/badge/platform-Proxmox-lightgrey)

## HA DNS, Monitoring, Alerting, Secure Remote Access, and Proxmox-Based Core Services

This repository documents my completed home infrastructure lab: a resilient home network foundation with high availability DNS, recursive DNS, monitoring, alerting, secure remote access, and Proxmox-hosted core services.

This project is complete and closed out.

Future work involving the ER605 live cutover, managed switch production cutover, VLAN segmentation, firewall policy, and SSID-to-VLAN mapping will be handled in a separate network segmentation project.

---

## Quick Links

| Area | Link |
|---|---|
| Current Status | [CURRENT-STATUS.md](CURRENT-STATUS.md) |
| Roadmap | [ROADMAP.md](ROADMAP.md) |
| Lessons Learned | [LESSONS-LEARNED.md](LESSONS-LEARNED.md) |
| Changelog | [CHANGELOG.md](CHANGELOG.md) |
| Documentation Hub | [docs/](docs/) |
| Architecture Diagrams | [diagrams/](diagrams/) |
| Screenshots | [screenshots/](screenshots/) |
| Config Examples | [configs/](configs/) |

---

## About This Project

This project started as a home DNS and network-control lab, then evolved into a production-style infrastructure foundation.

Instead of relying only on ISP-managed networking, I built and documented a layered environment that includes:

- Network control and ISP migration
- Centralized DNS with Pi-hole
- High availability DNS with Keepalived and Gravity Sync
- Local recursive DNS with Unbound
- Monitoring with Prometheus and Grafana
- Alert routing with Alertmanager and Discord
- Secure remote administration with Tailscale
- Self-hosted RustDesk remote access
- Proxmox-hosted infrastructure services
- Docker monitoring migration from workstation to VM
- Validation, screenshots, and GitHub-based documentation

---

## Why I Built This

I wanted a practical infrastructure project that would help me understand how home networks, DNS, monitoring, remote access, virtualization, and operational validation work together.

This lab gave me hands-on experience with:

- Building network services from the ground up
- Reducing single points of failure
- Validating failover behavior
- Troubleshooting ISP and router differences
- Using monitoring and alerting for infrastructure visibility
- Documenting a real technical project in a professional format

---

## Final Architecture Overview

### Core DNS Path

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

### Monitoring and Alerting Path

    Node Exporter / Blackbox Exporter
      ↓
    Prometheus
      ↓
    Grafana Dashboards
      ↓
    Alertmanager
      ↓
    Discord Alerts

### Remote Administration Path

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

### Proxmox Service Layer

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

---

## Completed Phases

| Phase | Status | Focus |
|---|---:|---|
| Phase 1 - Network Control | ✅ Complete | Network control and baseline topology |
| Phase 1.5 - ISP Migration | ✅ Complete | Xfinity to AT&T Fiber migration |
| Phase 2 - DNS Control | ✅ Complete | Pi-hole DNS control |
| Phase 3 - High Availability DNS | ✅ Complete | Keepalived, Gravity Sync, and Unbound |
| Phase 4 - Monitoring and Alerting | ✅ Complete | Prometheus, Grafana, Alertmanager, Discord |
| Phase 5 - Tailscale Remote Access | ✅ Complete | Secure remote administration |
| Phase 6 - Proxmox, Omada, Docker Monitoring | ✅ Complete | Proxmox-hosted infrastructure services |
| Phase 6.5 - RustDesk Remote Access | ✅ Complete | Self-hosted remote access and VM hardening |

---

## Documentation

### Phase 1 - Network Control

| Document | Link |
|---|---|
| Overview | [View](docs/phase-1-network-control.md) |
| Step-by-Step Guide | [View](docs/phase-1-step-by-step.md) |

### Phase 1.5 - ISP Migration

| Document | Link |
|---|---|
| Overview | [View](docs/phase-1.5-isp-migration.md) |
| Step-by-Step Guide | [View](docs/phase-1.5-step-by-step.md) |

### Phase 2 - DNS Control

| Document | Link |
|---|---|
| Overview | [View](docs/phase-2-dns-control.md) |
| Step-by-Step Guide | [View](docs/phase-2-step-by-step.md) |

### Phase 3 - High Availability DNS

| Document | Link |
|---|---|
| Overview | [View](docs/phase-3-ha-dns/overview.md) |
| Step-by-Step Guide | [View](docs/phase-3-ha-dns/step-by-step.md) |
| Jump Box Access | [View](docs/phase-3-ha-dns/jump-box-access.md) |
| Validation and Failover Tests | [View](docs/phase-3-ha-dns/validation-failover-tests.md) |
| Diagrams | [View](docs/phase-3-ha-dns/diagrams.md) |
| DNS Recursion with Unbound | [View](docs/phase-3-ha-dns/DNS-recursion-unbound.md) |

### Phase 4 - Monitoring and Alerting

| Document | Link |
|---|---|
| Overview | [View](docs/phase-4-monitoring-alerting/overview.md) |
| Step-by-Step Guide | [View](docs/phase-4-monitoring-alerting/step-by-step.md) |
| Dashboards | [View](docs/phase-4-monitoring-alerting/dashboards.md) |
| Alerting | [View](docs/phase-4-monitoring-alerting/alerting.md) |
| Validation | [View](docs/phase-4-monitoring-alerting/validation.md) |

### Phase 5 - Tailscale Remote Access

| Document | Link |
|---|---|
| Overview | [View](docs/phase-5-tailscale-remote-access/overview.md) |
| Step-by-Step Guide | [View](docs/phase-5-tailscale-remote-access/step-by-step.md) |
| Validation | [View](docs/phase-5-tailscale-remote-access/validation.md) |

### Phase 6 - Proxmox, Omada, and Docker Monitoring Foundation

| Document | Link |
|---|---|
| Phase Home | [View](docs/phase-6-proxmox-omada/README.md) |
| Overview | [View](docs/phase-6-proxmox-omada/overview.md) |
| Step-by-Step Guide | [View](docs/phase-6-proxmox-omada/step-by-step.md) |
| Validation | [View](docs/phase-6-proxmox-omada/validation.md) |
| Diagrams | [View](docs/phase-6-proxmox-omada/diagrams.md) |
| Managed Switch Pre-Staging | [View](docs/phase-6-proxmox-omada/managed-switch-prestaging.md) |

### Phase 6.5 - RustDesk Remote Access and VM Hardening

| Document | Link |
|---|---|
| Phase Home | [View](docs/phase-6.5-rustdesk-remote-access/README.md) |
| Overview | [View](docs/phase-6.5-rustdesk-remote-access/overview.md) |
| Step-by-Step Guide | [View](docs/phase-6.5-rustdesk-remote-access/step-by-step.md) |
| Validation | [View](docs/phase-6.5-rustdesk-remote-access/validation.md) |
| Diagrams | [View](docs/phase-6.5-rustdesk-remote-access/diagrams.md) |

### Project Closeout

| Document | Link |
|---|---|
| Current Status | [View](CURRENT-STATUS.md) |
| Roadmap | [View](ROADMAP.md) |
| Changelog | [View](CHANGELOG.md) |
| Lessons Learned | [View](LESSONS-LEARNED.md) |
| Project Closeout | [View](docs/project-closeout.md) |

---

## Architecture Diagrams

| Diagram | Link |
|---|---|
| Phase 1 - Previous Network / Xfinity | [View](diagrams/phase-1-previous-network-xfinity.md) |
| Phase 1.5 - ISP Migration / AT&T Fiber | [View](diagrams/phase-1.5-isp-migration-att-fiber.md) |
| Phase 2 - DNS Control | [View](diagrams/phase-2-dns-control.md) |
| Phase 3 - High Availability DNS | [View](diagrams/phase-3-ha-dns.md) |
| Phase 4 - Monitoring and Alerting | [View](diagrams/phase-4-monitoring-alerting.md) |
| Phase 5 - Tailscale Remote Access | [View](diagrams/phase-5-tailscale-remote-access.md) |
| Phase 6 - Proxmox and Service Migration | [View](diagrams/phase-6-proxmox-service-migration.md) |
| Phase 6.5 - RustDesk on Proxmox | [View](diagrams/phase-6.5-rustdesk-proxmox.md) |

> The ER605 cutover, production managed switching, VLAN segmentation, and SSID-to-VLAN work are intentionally excluded from this repository and will be tracked in a separate network segmentation project.

---

## Hardware and Lab Systems

| Component | Role |
|---|---|
| AT&T Fiber connection | WAN connectivity |
| ONT / Optical Network Terminal | Fiber handoff |
| AT&T Gateway with IP Passthrough | ISP gateway |
| TP-Link Deco X25 Mesh System | Routing and wireless access |
| Raspberry Pi 3B+ - ashpi-1 | Primary Pi-hole node |
| Raspberry Pi 3B - ashpi-2 | Backup Pi-hole node |
| Dell OptiPlex Proxmox host | Virtualization host |
| Docker Monitoring VM | Monitoring service host |
| RustDesk Server VM | Self-hosted remote access |
| Gaming PC / admin endpoint | Admin and testing endpoint |
| Laptop / remote admin endpoint | Remote testing and management |

---

## Core Tools and Services

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

## Security Notes

- No public SSH port forwarding is used.
- Tailscale provides private administrative access.
- RustDesk is kept LAN-only for this project.
- Portainer Agent is kept LAN-only.
- Monitoring services are kept LAN-only.
- Discord webhook secrets are stored locally and excluded from Git.
- Screenshots are redacted where needed.
- This repository avoids committing secrets, tokens, passwords, and private keys.

---

## What This Project Demonstrates

This project demonstrates practical infrastructure skills across:

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

## Future Work

The next major project is a separate repository focused on:

- ER605 live router cutover
- Managed switch as core switch
- Deco AP mode migration
- VLAN segmentation
- Inter-VLAN firewall policy
- Trusted, lab, IoT, and guest network isolation
- Future Omada EAP SSID-to-VLAN mapping

Suggested next repo title:

    Home Network Segmentation Lab - ER605, Managed Switching, and VLAN Isolation

---

## Goal

To build and document a realistic infrastructure foundation that demonstrates networking, DNS, high availability, monitoring, alerting, virtualization, secure access, and operational validation.
