# Roadmap 🗺️

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![Scope](https://img.shields.io/badge/scope-home%20infrastructure-blue)
![Next](https://img.shields.io/badge/next-network%20segmentation-orange)

## Project Roadmap Summary

This roadmap documents the completed buildout of the Home Network Infrastructure Lab.

The project moved from basic network control to high availability DNS, recursive DNS, monitoring, alerting, secure remote access, and Proxmox-hosted infrastructure services.

This roadmap is now closed.

---

## Completed Phase Timeline

| Phase | Status | Focus |
|---|---:|---|
| Phase 1 - Network Control | ✅ Complete | Baseline network control and topology |
| Phase 1.5 - ISP Migration | ✅ Complete | Xfinity to AT&T Fiber migration |
| Phase 2 - DNS Control | ✅ Complete | Centralized DNS with Pi-hole |
| Phase 3 - High Availability DNS | ✅ Complete | Keepalived, Gravity Sync, and Unbound |
| Phase 4 - Monitoring and Alerting | ✅ Complete | Prometheus, Grafana, Alertmanager, Discord |
| Phase 5 - Tailscale Remote Access | ✅ Complete | Private remote administration |
| Phase 6 - Proxmox, Omada, Docker Monitoring | ✅ Complete | Virtualization and service hosting foundation |
| Phase 6.5 - RustDesk Remote Access | ✅ Complete | Self-hosted remote access and VM hardening |

---

## Phase 1 - Network Control

Status: ✅ Complete

Purpose:

Establish the initial home network baseline and document the environment before adding DNS control, failover, monitoring, or remote access.

Completed:

- Documented initial network layout
- Identified ISP gateway and router roles
- Established baseline topology
- Captured early network state
- Built foundation for DNS control

---

## Phase 1.5 - ISP Migration

Status: ✅ Complete

Purpose:

Document the move from Xfinity to AT&T Fiber and capture the differences between bridge mode and IP Passthrough.

Completed:

- Migrated from Xfinity to AT&T Fiber
- Documented ONT and AT&T Gateway role
- Captured IP Passthrough behavior
- Compared ISP gateway behavior
- Updated architecture documentation

Key lesson:

ISP equipment behavior can significantly affect network design, NAT behavior, and router placement.

---

## Phase 2 - DNS Control

Status: ✅ Complete

Purpose:

Introduce centralized DNS filtering and visibility using Pi-hole.

Completed:

- Deployed Pi-hole
- Pointed clients/network DNS toward Pi-hole
- Validated query visibility
- Confirmed DNS filtering
- Documented DNS control behavior

---

## Phase 3 - High Availability DNS

Status: ✅ Complete

Purpose:

Remove Pi-hole as a single point of failure by adding HA DNS with a virtual IP, replication, and recursive DNS.

Completed:

- Added second Pi-hole node
- Configured Keepalived VIP
- Configured Gravity Sync
- Added Unbound recursive DNS
- Validated DNS failover
- Documented failover tests

Final HA DNS endpoint:

    192.168.68.20

---

## Phase 4 - Monitoring and Alerting

Status: ✅ Complete

Purpose:

Add visibility into infrastructure health and DNS availability.

Completed:

- Deployed Prometheus
- Deployed Grafana
- Deployed Alertmanager
- Added Blackbox Exporter
- Added Node Exporter
- Built dashboards
- Configured Discord alerts
- Validated alert behavior

---

## Phase 5 - Tailscale Remote Access

Status: ✅ Complete

Purpose:

Add secure remote administration without exposing services publicly.

Completed:

- Installed Tailscale
- Added devices to Tailnet
- Validated remote SSH access
- Tested remote access from mobile
- Documented access model

Design decision:

Remote administration should use private overlay networking instead of public port exposure.

---

## Phase 6 - Proxmox, Omada, Docker Monitoring Foundation

Status: ✅ Complete

Purpose:

Move infrastructure services onto a dedicated virtualization platform and prepare for managed network expansion.

Completed:

- Built Proxmox service layer
- Added Omada Controller LXC
- Migrated Docker monitoring services to VM
- Added Portainer Agent
- Documented Proxmox service placement
- Prepared managed switch staging documentation

---

## Phase 6.5 - RustDesk Remote Access and VM Hardening

Status: ✅ Complete

Purpose:

Add self-hosted remote access and document VM hardening.

Completed:

- Deployed RustDesk server VM
- Configured hbbs and hbbr containers
- Kept service LAN-only
- Hardened VM access
- Documented validation
- Added architecture diagram

---

## Closed Scope

The following items are intentionally excluded from this completed repo and will move to a separate project:

| Item | Reason |
|---|---|
| ER605 live router cutover | Belongs to segmentation project |
| Managed switch production cutover | Belongs to segmentation project |
| VLAN design | Separate routing/switching scope |
| Inter-VLAN firewall rules | Separate segmentation scope |
| SSID-to-VLAN mapping | Requires AP/VLAN design |
| IoT and guest isolation | Separate segmentation scope |

---

## Next Roadmap

Next project:

**Home Network Segmentation Lab - ER605, Managed Switching, and VLAN Isolation**

Planned focus:

- ER605 as managed router/firewall
- Managed switch as core switch
- Deco AP mode
- VLAN segmentation
- Inter-VLAN policy
- Trusted, lab, IoT, and guest networks
- Omada EAP planning later
