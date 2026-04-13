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

## Phase 5 — Remote Access 🔐

* Deployed Tailscale for secure remote administration
* Added gaming PC to the tailnet
* Added laptop to the tailnet
* Added `ashpi-1` to the tailnet
* Added `ashpi-2` to the tailnet
* Confirmed MagicDNS-based device naming
* Validated `tailscale ping` connectivity to both Raspberry Pi nodes
* Successfully SSH’d to `ashpi-1` over Tailscale
* Successfully SSH’d to `ashpi-2` over Tailscale
* Successfully validated remote SSH access from outside the home network using a phone hotspot
* Avoided public SSH exposure and router port forwarding
* Established a private remote admin path to the HA DNS environment

---

## Next Infrastructure Layer 🌐

* Add managed switching
* Introduce VLANs and segmentation
* Separate trusted / guest / IoT networks
* Refine policy-driven access between networks
* Migrate monitoring to a dedicated always-on management host
