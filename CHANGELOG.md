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

## Upcoming — Phase 3 (High Availability DNS)

* Deploy second Pi-hole node
* Configure Gravity Sync
* Implement Keepalived
* Introduce virtual IP for failover
* Validate DNS redundancy
