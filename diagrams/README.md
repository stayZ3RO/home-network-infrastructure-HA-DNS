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
