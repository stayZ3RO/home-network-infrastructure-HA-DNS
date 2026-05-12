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
