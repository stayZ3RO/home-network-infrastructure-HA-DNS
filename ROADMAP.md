# Roadmap 🛣️

This roadmap outlines the planned evolution of the home network infrastructure lab.

---

## Phase 1 — Network Control ✅

* Enabled bridge mode (Xfinity)
* Deployed mesh router (Deco)
* Eliminated double NAT
* Established full control of routing

---

## Phase 1.5 — ISP Migration (AT&T Fiber) ✅

* Migrated from Xfinity to AT&T Fiber
* Integrated ONT into the network
* Configured IP Passthrough
* Preserved the internal network structure
* Maintained Pi-hole DNS functionality

---

## Phase 2 — DNS Control (Pi-hole) ✅

* Deployed Pi-hole on Raspberry Pi
* Configured DHCP DNS routing
* Enabled network-wide ad blocking
* Gained DNS query visibility
* Resolved the gravity database issue

---

## Phase 3 — High Availability DNS ✅

* Deployed a second Pi-hole node
* Configured Gravity Sync
* Implemented keepalived
* Created a virtual IP (VIP)
* Added Unbound on both nodes
* Validated DNS failover and recursive DNS continuity

---

## Phase 4 — Monitoring & Alerting ✅

* Deployed Prometheus
* Configured Grafana dashboards
* Added Blackbox Exporter for DNS probing
* Added Alertmanager for alert handling
* Installed Node Exporter on both Pi nodes
* Monitored node health and DNS service availability
* Validated alert lifecycle and failover visibility

---

## Phase 5 — Secure Remote Access ✅

* Deployed Tailscale
* Added admin endpoints to the tailnet
* Added both Raspberry Pi nodes to the tailnet
* Validated secure SSH access over Tailscale
* Confirmed off-site access without public SSH exposure

---

## Next Infrastructure Layer 🌐

* Introduce a managed switch
* Add VLAN segmentation
* Separate admin / trusted / guest / IoT networks
* Refine inter-network policy design
* Move monitoring to a dedicated always-on management host
* Expand infrastructure with mini workstation / Proxmox-based services
