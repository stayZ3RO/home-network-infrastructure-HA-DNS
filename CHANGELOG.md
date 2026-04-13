# Changelog 📝

All notable changes to this project are documented here.

---

## Phase 1 — Network Control 🌐

* Enabled bridge mode on ISP gateway (Xfinity)
* Deployed Deco mesh system as primary router
* Eliminated double NAT
* Disabled ISP WiFi broadcasting
* Established full control of internal network routing

---

## Phase 1.5 — ISP Migration (AT&T Fiber) 🔌

* Migrated from Xfinity to AT&T Fiber
* Integrated ONT for fiber connection
* Configured IP Passthrough on AT&T gateway
* Connected Deco router via Ethernet (WAN)
* Preserved internal subnet (`192.168.68.x`)
* Maintained Pi-hole DNS functionality
* Verified public IP assignment to router
* Disabled AT&T WiFi radios

---

## Phase 2 — DNS Control (Pi-hole) 🕳️

* Installed Pi-hole on Raspberry Pi
* Configured router DHCP to use Pi-hole as DNS
* Enabled network-wide ad blocking
* Implemented DNS query logging and visibility
* Added blocklists for filtering
* Resolved gravity database error (`-2`)
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
* Confirmed recursive DNS resolution remained functional after failover

---

## Phase 4 — Monitoring & Alerting 📈

* Deployed Prometheus on the temporary monitoring host
* Deployed Grafana for dashboards and data exploration
* Deployed Alertmanager for alert handling
* Deployed Blackbox Exporter for DNS probe monitoring
* Integrated Docker Desktop with Ubuntu WSL as the management workflow
* Installed Node Exporter on `ashpi-1` and `ashpi-2`
* Configured Prometheus to scrape both Raspberry Pi nodes on port `9100`
* Configured Blackbox Exporter to probe:
  * the HA DNS VIP (`192.168.68.20:53`)
  * `ashpi-1` direct DNS (`192.168.68.60:53`)
  * `ashpi-2` direct DNS (`192.168.68.61:53`)
* Built the **Node Health** Grafana dashboard
* Built the **DNS & Failover** Grafana dashboard
* Added alert rules for:
  * single node down
  * both nodes down
  * VIP DNS down
  * elevated VIP DNS latency
  * direct DNS node probe failure
* Validated alert lifecycle from pending → firing → cleared
* Validated keepalived failover while confirming VIP DNS stayed healthy
* Confirmed monitoring reflected healthy failover without generating a false critical outage alert
* Backed up the monitoring configuration and exported dashboards for reuse

---

## Upcoming — Phase 5 (Remote Access) 🔐

* Refine the jump-box workflow
* Introduce hardened remote administrative access
* Restrict exposure of internal services
* Prepare for future segmented management access
