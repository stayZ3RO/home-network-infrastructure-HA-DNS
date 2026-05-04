# Architecture Diagrams 🧱

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![Format](https://img.shields.io/badge/format-text%20diagrams-blue)

This folder contains architecture diagrams for the Home Network Infrastructure Lab.

The diagrams are intentionally text-based so they are easy to version, review, and update in GitHub.

---

## Diagram Index

| Phase | Diagram | Purpose |
|---|---|---|
| Phase 1 - Previous Network / Xfinity | [View](phase-1-previous-network-xfinity.md) | Documents the original ISP/network baseline |
| Phase 1.5 - ISP Migration / AT&T Fiber | [View](phase-1.5-isp-migration-att-fiber.md) | Shows the AT&T Fiber topology |
| Phase 2 - DNS Control | [View](phase-2-dns-control.md) | Shows Pi-hole DNS control path |
| Phase 3 - High Availability DNS | [View](phase-3-ha-dns.md) | Shows HA Pi-hole, VIP, and Unbound design |
| Phase 4 - Monitoring and Alerting | [View](phase-4-monitoring-alerting.md) | Shows Prometheus, Grafana, Alertmanager flow |
| Phase 5 - Tailscale Remote Access | [View](phase-5-tailscale-remote-access.md) | Shows private remote access model |
| Phase 6 - Proxmox Service Migration | [View](phase-6-proxmox-service-migration.md) | Shows Proxmox and service placement |
| Phase 6.5 - RustDesk on Proxmox | [View](phase-6.5-rustdesk-proxmox.md) | Shows self-hosted RustDesk layout |

---

## Final Architecture Themes

The diagrams document these major infrastructure patterns:

| Theme | Description |
|---|---|
| Network baseline | ISP gateway, router, and client path |
| DNS control | Pi-hole as centralized DNS |
| HA DNS | Keepalived VIP and secondary Pi-hole |
| Recursive DNS | Unbound local recursive resolution |
| Observability | Prometheus, Grafana, exporters, Alertmanager |
| Secure remote access | Tailscale private access |
| Virtualization | Proxmox-hosted services |
| Self-hosted remote access | RustDesk LAN-only deployment |

---

## Diagram Style

Diagrams in this repository focus on:

- Clear service relationships
- Network paths
- Security boundaries
- Failover behavior
- Service placement
- Future expansion separation

---

## Out of Scope

The following future designs are intentionally not included in this completed repo:

- ER605 live cutover
- Managed switch as core switch
- VLAN segmentation
- Inter-VLAN firewall policy
- SSID-to-VLAN mapping
- IoT and guest isolation

Those will be tracked in a separate network segmentation project.
