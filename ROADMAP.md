# Roadmap 🗺️

## Project 1 Status

**Complete / Closed Out**

This roadmap now reflects the completed scope of the HA DNS and core infrastructure foundation project.

Future segmentation work has been moved into a separate project.

---

## Completed Scope

### Phase 1 — Network Control ✅

- Established baseline network control
- Deployed Deco mesh router
- Reduced ISP-managed network dependency
- Documented the original network topology

### Phase 1.5 — ISP Migration / AT&T Fiber ✅

- Migrated from Xfinity to AT&T Fiber
- Integrated ONT into the network
- Configured AT&T IP Passthrough
- Preserved the internal network structure
- Updated diagrams and documentation

### Phase 2 — DNS Control / Pi-hole ✅

- Deployed Pi-hole
- Configured network-wide DNS filtering
- Enabled DNS query visibility
- Validated client DNS behavior

### Phase 3 — High Availability DNS ✅

- Deployed second Pi-hole node
- Configured Gravity Sync
- Configured Keepalived VIP failover
- Added Unbound recursive DNS to both nodes
- Validated DNS continuity during failover

### Phase 4 — Monitoring & Alerting ✅

- Deployed Prometheus
- Deployed Grafana
- Deployed Alertmanager
- Deployed Blackbox Exporter
- Installed Node Exporter on Raspberry Pi nodes
- Configured Discord alert delivery
- Validated alert lifecycle and failover visibility

### Phase 5 — Secure Remote Access ✅

- Deployed Tailscale
- Added admin endpoints to the tailnet
- Validated remote SSH access
- Avoided public SSH exposure and port forwarding

### Phase 6 — Proxmox, Omada & Docker Monitoring Foundation ✅

- Deployed Proxmox host
- Deployed Omada Controller LXC
- Created Docker monitoring VM
- Migrated monitoring stack from gaming PC to VM
- Preconfigured ER605 router
- Pre-staged managed switch
- Validated backups

### Phase 6.5 — RustDesk Remote Access & VM Hardening ✅

- Deployed RustDesk Server OSS on Debian VM
- Hardened SSH
- Configured UFW LAN-only rules
- Validated RustDesk clients
- Renamed `docker-services` to `docker-monitoring`
- Configured Docker log rotation
- Configured Prometheus retention
- Installed Portainer Agent
- Expanded monitoring VM disk to `50GB`
- Completed final Proxmox backups

---

## Future Work Moved to Separate Project

The following work is intentionally moved into a dedicated network segmentation lab:

- ER605 live router cutover
- Managed switch as core switch
- Deco AP mode migration
- VLAN segmentation
- Inter-VLAN firewall rules
- Management, production, lab, IoT, and guest isolation
- SSID-to-VLAN mapping with Omada EAPs
- Network isolation testing
- Policy-driven access validation

Suggested next project title:

```text
Home Network Segmentation Lab — ER605, Managed Switching & VLAN Isolation
```

---

## Future Service Ideas

Potential future additions outside this repository:

- internal documentation/wiki
- uptime/status page
- centralized log collection
- lightweight ticket or inventory tooling
- media service testing
- self-hosted development environments
- additional automation scripts
- secure remote support tooling
- app-hosting VM with Portainer Server

---

## Long-Term Goal

Continue evolving the lab into a production-style home infrastructure environment that demonstrates:

- network design
- DNS control
- high availability
- monitoring and alerting
- secure remote access
- segmentation and access control
- virtualization
- infrastructure documentation
- real troubleshooting and validation
