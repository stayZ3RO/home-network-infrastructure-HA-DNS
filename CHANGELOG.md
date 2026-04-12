# Changelog

All notable changes to this project are documented here.

---

## Phase 1 — Network Control

* Enabled bridge mode on ISP gateway (Xfinity)
* Deployed Deco mesh system as primary router
* Eliminated double NAT
* Disabled ISP WiFi broadcasting
* Established full control of internal network routing

---

## Phase 1.5 — ISP Migration (AT&T Fiber)

* Migrated from Xfinity to AT&T Fiber
* Integrated ONT for fiber connection
* Configured IP Passthrough on AT&T gateway
* Connected Deco router via Ethernet (WAN)
* Preserved internal subnet (192.168.68.x)
* Maintained Pi-hole DNS functionality
* Verified public IP assignment to router
* Disabled AT&T WiFi radios

---

## Phase 2 — DNS Control (Pi-hole)

* Installed Pi-hole on Raspberry Pi
* Configured router DHCP to use Pi-hole as DNS
* Enabled network-wide ad blocking
* Implemented DNS query logging and visibility
* Added blocklists for filtering
* Resolved gravity database error (-2)
* Validated DNS traffic across all devices

---

## Phase 3 — High Availability DNS 🛡️

* Added a second Raspberry Pi DNS node
* Installed Pi-hole on both nodes
* Implemented Gravity Sync for configuration replication
* Configured keepalived for virtual IP (VIP) failover
* Removed the single-node DNS failure point
* Validated VIP movement between primary and secondary nodes
* Added Unbound recursive resolver on both Pi-hole nodes
* Updated each Pi-hole instance to use its local Unbound resolver on port `5335`
* Verified direct Unbound recursion on both nodes
* Confirmed Pi-hole filtering remained functional with Unbound
* Verified DNS resolution through the VIP
* Verified DNS continuity during simulated failover
* Verified recursive DNS resolution remained functional after failover

---

## Upcoming — Phase 4 (Monitoring & Alerting) 📈

* Add node health visibility
* Monitor DNS availability and failover behavior
* Track system resources and service uptime
* Build alerting with reduced noise and better signal quality
