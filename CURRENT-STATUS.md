# Current Project Status ✅

## Project Status

**Complete / Closed Out**

This repository is complete as Project 1: a home network infrastructure foundation focused on HA DNS, observability, secure remote access, and Proxmox-hosted core services.

Future routing cutover, managed switching, VLAN segmentation, firewall policy, and SSID-to-VLAN mapping will be handled in a separate network segmentation project.

---

## Completed Phase Structure

| Phase | Status | Focus |
|---|---|---|
| Phase 1 — Network Control | Complete | Baseline home network control |
| Phase 1.5 — ISP Migration | Complete | Xfinity to AT&T Fiber migration |
| Phase 2 — DNS Control | Complete | Centralized DNS through Pi-hole |
| Phase 3 — High Availability DNS | Complete | Pi-hole HA with Keepalived, Gravity Sync, and Unbound |
| Phase 4 — Monitoring & Alerting | Complete | Grafana, Prometheus, Alertmanager, Blackbox Exporter, Discord alerts |
| Phase 5 — Tailscale Remote Access | Complete | Secure private admin access |
| Phase 6 — Proxmox, Omada & Docker Monitoring Foundation | Complete | Proxmox, Omada Controller, monitoring migration, switch pre-staging |
| Phase 6.5 — RustDesk Remote Access & VM Hardening | Complete | RustDesk, Docker hardening, Portainer Agent, backup validation |

---

## Documentation Links

- [Phase 1 — Network Control](docs/phase-1-network-control/README.md)
- [Phase 1.5 — ISP Migration](docs/phase-1.5-isp-migration/README.md)
- [Phase 2 — DNS Control](docs/phase-2-dns-control/README.md)
- [Phase 3 — High Availability DNS](docs/phase-3-ha-dns/README.md)
- [Phase 4 — Monitoring & Alerting](docs/phase-4-monitoring-alerting/README.md)
- [Phase 5 — Tailscale Remote Access](docs/phase-5-tailscale-remote-access/README.md)
- [Phase 6 — Proxmox, Omada & Docker Monitoring Foundation](docs/phase-6-proxmox-omada-foundation/README.md)
- [Phase 6.5 — RustDesk Remote Access & VM Hardening](docs/phase-6.5-rustdesk-remote-access/README.md)
- [Project Closeout](docs/project-closeout.md)

---

## Final Architecture Direction

```text
AT&T Fiber
  ↓
AT&T Gateway / IP Passthrough
  ↓
Deco Mesh Router
  ↓
Clients / Proxmox / Raspberry Pi HA DNS
```

Core services:

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

## Completed Core Services

- Pi-hole HA DNS with Keepalived and Gravity Sync
- Unbound recursive DNS on both Pi-hole nodes
- Prometheus, Grafana, Alertmanager, and Blackbox Exporter
- Node Exporter on Raspberry Pi nodes
- Discord alert delivery through Alertmanager
- Tailscale remote access
- Proxmox infrastructure host
- Omada Controller LXC
- Docker monitoring VM
- Portainer Agent on monitoring VM
- RustDesk self-hosted remote access
- ER605 preconfiguration
- Managed switch pre-staging
- Proxmox backup validation

---

## Moved to Separate Project

The following work is intentionally moved out of this repository:

- ER605 production router cutover
- Managed switch production cutover
- Deco AP mode migration
- VLAN segmentation
- Inter-VLAN firewall rules
- Trusted / lab / IoT / guest isolation
- SSID-to-VLAN mapping with Omada EAPs

This keeps Project 1 focused and complete while giving the segmentation work its own dedicated project scope.
