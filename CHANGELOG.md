# Changelog 📝

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![Project](https://img.shields.io/badge/project-home%20infrastructure-blue)

## Overview

This changelog summarizes the major infrastructure and documentation milestones for the Home Network Infrastructure Lab.

The project is complete and closed out.

---

## Phase 1 - Network Control

Status: ✅ Complete

Added:

- Initial network topology documentation
- Network control overview
- Step-by-step network baseline documentation
- Early architecture references

Completed:

- Documented existing network layout
- Identified gateway/router responsibilities
- Established baseline network understanding

---

## Phase 1.5 - ISP Migration

Status: ✅ Complete

Added:

- ISP migration documentation
- Xfinity to AT&T Fiber comparison
- AT&T IP Passthrough notes
- Updated topology documentation

Completed:

- Migrated network documentation from Xfinity model to AT&T Fiber model
- Captured ONT and AT&T Gateway role
- Documented IP Passthrough behavior

---

## Phase 2 - DNS Control

Status: ✅ Complete

Added:

- Pi-hole DNS control documentation
- DNS validation notes
- Centralized DNS visibility documentation

Completed:

- Deployed Pi-hole DNS control
- Validated DNS filtering
- Confirmed query visibility
- Documented DNS path

---

## Phase 3 - High Availability DNS

Status: ✅ Complete

Added:

- HA DNS overview
- Keepalived documentation
- Gravity Sync documentation
- Jump box access notes
- Unbound recursive DNS documentation
- Failover validation tests
- HA DNS diagrams

Completed:

- Added secondary Pi-hole node
- Configured Keepalived VIP
- Configured Gravity Sync replication
- Added Unbound recursive DNS
- Validated failover and recovery

---

## Phase 4 - Monitoring and Alerting

Status: ✅ Complete

Added:

- Prometheus documentation
- Grafana dashboard documentation
- Alertmanager documentation
- Discord alerting notes
- Blackbox Exporter validation
- Monitoring validation screenshots

Completed:

- Built monitoring stack
- Added DNS/service availability checks
- Built dashboards
- Configured alert routing
- Validated alert firing and recovery behavior

---

## Phase 5 - Tailscale Remote Access

Status: ✅ Complete

Added:

- Tailscale overview
- Remote access step-by-step guide
- Remote access validation documentation

Completed:

- Installed and configured Tailscale
- Validated remote SSH access
- Tested access from mobile/admin endpoint
- Documented private remote administration model

---

## Phase 6 - Proxmox, Omada, Docker Monitoring Foundation

Status: ✅ Complete

Added:

- Proxmox service foundation documentation
- Omada Controller LXC documentation
- Docker monitoring VM documentation
- Managed switch pre-staging notes
- Service migration diagrams
- Validation evidence

Completed:

- Built Proxmox service layer
- Added Omada Controller LXC
- Migrated monitoring stack to Docker VM
- Added Portainer Agent
- Documented managed switch pre-staging

---

## Phase 6.5 - RustDesk Remote Access and VM Hardening

Status: ✅ Complete

Added:

- RustDesk overview
- RustDesk step-by-step guide
- RustDesk validation documentation
- RustDesk architecture diagram
- VM hardening notes

Completed:

- Deployed self-hosted RustDesk server
- Configured hbbs and hbbr
- Kept RustDesk LAN-only
- Hardened VM baseline
- Documented validation evidence

---

## Repository Polish

Status: ✅ Complete

Added:

- Polished main README
- Documentation hub
- Config examples landing page
- Screenshot evidence landing page
- Updated current status
- Updated roadmap
- Updated lessons learned
- Updated changelog
- Improved repo metadata and topics

---

## Closed Scope

The following items are intentionally excluded from this completed repository:

- ER605 live router cutover
- Managed switch production cutover
- Deco AP mode migration
- VLAN segmentation
- Inter-VLAN firewall policies
- SSID-to-VLAN mapping
- IoT and guest network isolation

These will be tracked in a separate network segmentation project.
