# Roadmap

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
* Integrated ONT into network
* Configured IP Passthrough
* Preserved internal network structure
* Maintained Pi-hole DNS functionality

---

## Phase 2 — DNS Control (Pi-hole) ✅

* Deployed Pi-hole on Raspberry Pi
* Configured DHCP DNS routing
* Enabled network-wide ad blocking
* Gained DNS query visibility
* Resolved gravity database issue

---

## Phase 3 — High Availability DNS (In Progress)

* Deploy second Pi-hole node
* Configure Gravity Sync
* Implement Keepalived
* Create virtual IP (VIP)
* Test DNS failover

---

## Phase 4 — Monitoring & Observability

* Deploy Prometheus
* Configure Grafana dashboards
* Monitor DNS and system metrics
* Implement alerting

---

## Phase 5 — Secure Remote Access

* Deploy Tailscale or similar VPN
* Enable secure remote access to services
* Implement access control

---

## Long-Term Goals

* Introduce VLAN segmentation
* Add containerization (Docker)
* Explore Proxmox or virtualization
* Simulate production-style infrastructure
