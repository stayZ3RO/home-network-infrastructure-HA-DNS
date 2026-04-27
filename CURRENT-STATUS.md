# Current Project Status

## Current Phase Structure

| Phase | Status | Focus |
|---|---|---|
| Phase 1 — Network Control | Complete | Baseline home network control |
| Phase 1.5 — ISP Migration | Complete | Xfinity to AT&T Fiber migration |
| Phase 2 — DNS Control | Complete | Centralized DNS through Pi-hole |
| Phase 3 — High Availability DNS | Complete | Pi-hole HA with Keepalived, Gravity Sync, and Unbound |
| Phase 4 — Monitoring & Alerting | Complete | Grafana, Prometheus, Alertmanager, and Blackbox Exporter |
| Phase 5 — Tailscale Remote Access | Complete | Secure remote access to lab devices |
| Phase 6 — Proxmox Infrastructure & Omada Network Foundation | Complete / Updating | Proxmox, Omada Controller, Docker VM, ER605 prep, switch prep |
| Phase 6.5 — RustDesk Remote Access Hardening | Planned / In Progress | Self-hosted RustDesk hardening and validation |
| Phase 7 — Managed Routing & Switching Cutover | Planned | ER605 cutover, managed switch core, Deco AP mode |
| Phase 8 — VLAN Segmentation & Network Isolation | Planned | Management, production, lab, and IoT/guest VLANs |

## Documentation Links

- [Phase 1 — Network Control](docs/phase-1-network-control/README.md)
- [Phase 1.5 — ISP Migration](docs/phase-1.5-isp-migration/README.md)
- [Phase 2 — DNS Control](docs/phase-2-dns-control/README.md)
- [Phase 3 — High Availability DNS](docs/phase-3-ha-dns/README.md)
- [Phase 4 — Monitoring & Alerting](docs/phase-4-monitoring-alerting/README.md)
- [Phase 5 — Tailscale Remote Access](docs/phase-5-tailscale-remote-access/README.md)
- [Phase 6 — Proxmox Infrastructure & Omada Network Foundation](docs/phase-6-proxmox-omada-foundation/README.md)
- [Phase 6.5 — RustDesk Remote Access Hardening](docs/phase-6.5-rustdesk-remote-access/README.md)
- [Phase 7 — Managed Routing & Switching Cutover](docs/phase-7-managed-routing-switching-cutover/README.md)
- [Phase 8 — VLAN Segmentation & Network Isolation](docs/phase-8-vlan-segmentation/README.md)

## Current Architecture Direction

The lab has evolved from a basic home network into a more production-like infrastructure environment.

**AT&T Fiber → AT&T Gateway / IP Passthrough → ER605 Router / Firewall → Managed Switch → Proxmox Host / Pi-hole HA / Deco APs / Clients**

## Completed Core Services

- Pi-hole HA DNS with Keepalived and Gravity Sync
- Unbound recursive DNS
- Grafana, Prometheus, Alertmanager, and Blackbox Exporter
- Tailscale remote access
- Proxmox infrastructure host
- Omada Controller LXC
- Docker monitoring VM
- ER605 router preconfiguration
- Managed switch pre-staging

## Next Major Work

- Harden RustDesk remote access
- Complete ER605 and managed switch cutover
- Move Deco mesh into AP mode
- Implement VLAN segmentation
