# Changelog

All notable changes to this project are documented here.

---

## Project Closeout

- Marked Project 1 as complete
- Clarified that future ER605 cutover and VLAN segmentation will move to a separate project
- Updated README, current status, roadmap, changelog, lessons learned, and project closeout documentation
- Removed Phase 7 and Phase 8 from this repository's active scope

---

## Phase 6.5 — RustDesk Remote Access & VM Hardening

- Deployed RustDesk Server OSS on a Debian VM
- Assigned RustDesk VM static IP `192.168.68.83`
- Configured SSH key-based access
- Hardened SSH by disabling root login and password authentication
- Deployed RustDesk `hbbs` and `hbbr` containers with Docker Compose
- Configured UFW LAN-only rules for RustDesk and SSH
- Validated RustDesk clients between laptop, gaming PC, and phone
- Created Proxmox backup for RustDesk VM
- Renamed `docker-services` VM to `docker-monitoring`
- Renamed Ubuntu hostname to `docker-monitoring`
- Configured Docker log rotation
- Configured Prometheus retention to `30d` / `10GB`
- Installed Portainer Agent on the monitoring VM
- Expanded the monitoring VM disk to `50GB`
- Expanded Ubuntu filesystem inside the VM
- Completed final Docker validation after resize
- Created final Proxmox backup after monitoring VM maintenance

---

## Phase 6 — Proxmox, Omada & Docker Monitoring Foundation

- Deployed Proxmox host environment
- Created Omada Controller LXC
- Created Ubuntu Docker monitoring VM
- Installed Docker Engine and Docker Compose on the monitoring VM
- Migrated Grafana, Prometheus, Alertmanager, and Blackbox Exporter from Docker Desktop to the VM
- Restored Grafana dashboards and Prometheus data
- Recreated Alertmanager Discord webhook secret handling
- Validated Prometheus targets, Blackbox probes, dashboards, and Discord alert delivery
- Stopped the old gaming PC Docker monitoring stack
- Confirmed monitoring no longer depends on the gaming PC
- Preconfigured ER605 router for future cutover
- Pre-staged managed switch in Omada
- Validated client connectivity through the managed switch
- Created Proxmox backup evidence

---

## Phase 5 — Remote Access

- Deployed Tailscale for secure remote administration
- Added admin endpoints to the tailnet
- Added `ashpi-1` and `ashpi-2` to the tailnet
- Confirmed MagicDNS-based device naming
- Validated `tailscale ping` connectivity
- Validated SSH access over Tailscale
- Confirmed off-site access without public SSH exposure
- Avoided router port forwarding for administrative SSH

---

## Phase 4 — Monitoring & Alerting

- Deployed Prometheus
- Deployed Grafana
- Deployed Alertmanager
- Deployed Blackbox Exporter
- Installed Node Exporter on `ashpi-1` and `ashpi-2`
- Configured Prometheus target scraping
- Configured Blackbox DNS probes
- Built Node Health and DNS & Failover dashboards
- Added Prometheus alert rules
- Validated alert lifecycle from pending to firing to cleared
- Configured Discord alert delivery
- Stored Discord webhook locally as a secret
- Excluded alerting secrets from Git
- Validated manual Alertmanager test alerts to Discord
- Validated keepalived failover while confirming VIP DNS stayed healthy

---

## Phase 3 — High Availability DNS

- Added second Raspberry Pi DNS node
- Installed Pi-hole on both nodes
- Implemented Gravity Sync
- Configured Keepalived VIP failover
- Added Unbound recursive resolver on both Pi-hole nodes
- Verified DNS resolution through the VIP
- Verified DNS continuity during simulated failover
- Confirmed ad blocking remained active after failover

---

## Phase 2 — DNS Control

- Installed Pi-hole
- Configured router DHCP to use Pi-hole as DNS
- Enabled network-wide ad blocking
- Implemented DNS query logging and visibility
- Added blocklist management
- Resolved Pi-hole gravity database issue
- Validated DNS traffic across client devices

---

## Phase 1.5 — ISP Migration

- Migrated from Xfinity to AT&T Fiber
- Integrated ONT for fiber connection
- Configured IP Passthrough on AT&T gateway
- Connected Deco router through Ethernet WAN
- Preserved internal subnet `192.168.68.x`
- Maintained Pi-hole DNS functionality
- Updated topology and diagrams

---

## Phase 1 — Network Control

- Established initial baseline network control
- Deployed Deco mesh system as primary router
- Eliminated double NAT
- Disabled ISP Wi-Fi broadcasting where applicable
- Documented the starting network topology
