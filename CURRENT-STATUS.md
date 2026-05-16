# Current Project Status

## Status

### Complete / Closed Out

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
