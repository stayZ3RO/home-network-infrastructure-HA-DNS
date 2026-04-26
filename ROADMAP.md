# Roadmap 🛣️

This roadmap outlines the planned evolution of the home network infrastructure lab.

---

## Phase 1 — Network Control ✅

- Enabled bridge mode on the original Xfinity gateway
- Deployed Deco mesh router
- Eliminated double NAT
- Established full control of internal routing
- Disabled ISP-managed WiFi broadcasting

---

## Phase 1.5 — ISP Migration / AT&T Fiber ✅

- Migrated from Xfinity to AT&T Fiber
- Integrated ONT into the network
- Configured IP Passthrough
- Preserved the internal network structure
- Maintained Pi-hole DNS functionality
- Validated the router received the public-facing connection path

---

## Phase 2 — DNS Control / Pi-hole ✅

- Deployed Pi-hole on Raspberry Pi
- Configured DHCP DNS routing
- Enabled network-wide ad blocking
- Gained DNS query visibility
- Added blocklist management
- Resolved the gravity database issue
- Validated DNS behavior from client devices

---

## Phase 3 — High Availability DNS ✅

- Deployed a second Pi-hole node
- Configured Gravity Sync
- Implemented keepalived
- Created a Virtual IP for DNS failover
- Added Unbound on both nodes
- Validated DNS failover
- Validated recursive DNS continuity
- Confirmed ad blocking continued after failover

---

## Phase 4 — Monitoring & Alerting ✅

- Deployed Prometheus
- Configured Grafana dashboards
- Added Blackbox Exporter for DNS probing
- Added Alertmanager for alert handling
- Installed Node Exporter on both Pi nodes
- Monitored node health and DNS service availability
- Built Node Health and DNS & Failover dashboards
- Added service-impact-focused alert rules
- Validated alert lifecycle from pending → firing → cleared
- Configured Discord alert delivery through Alertmanager
- Stored Discord webhook locally as a secret
- Mounted the webhook secret into Alertmanager as read-only
- Excluded alerting secrets from Git
- Validated manual Alertmanager test alerts to Discord
- Validated failover visibility without false critical outage alerts

---

## Phase 5 — Secure Remote Access ✅

- Deployed Tailscale
- Added admin endpoints to the tailnet
- Added both Raspberry Pi nodes to the tailnet
- Validated secure SSH access over Tailscale
- Confirmed off-site access without public SSH exposure
- Avoided router port forwarding for administrative SSH

---

## Phase 6 — Proxmox Host Environment & Monitoring Migration ✅

- Deployed a Proxmox host environment
- Created an Ubuntu VM for monitoring services
- Installed Docker Engine on the Ubuntu VM
- Migrated Grafana, Prometheus, Alertmanager, and Blackbox Exporter from Docker Desktop
- Restored monitoring dashboards and alerting
- Recreated local secret handling for Discord alerts
- Validated Prometheus targets, Blackbox probes, dashboards, and Discord alert delivery
- Removed the gaming PC dependency for monitoring uptime

---

## Next Infrastructure Layer — Managed Network Segmentation 🌐

Planned next phase:

- introduce a managed router / firewall
- introduce a managed switch
- add VLAN segmentation
- separate admin / trusted / guest / IoT networks
- preserve HA DNS and ad blocking across segmented networks
- refine inter-network policy design
- document firewall rules and VLAN behavior
- validate DNS and monitoring across segmented networks

---

## Dedicated Management and Virtualization Layer 🖥️

Planned infrastructure expansion:

- migrate monitoring to a dedicated always-on management host
- introduce Proxmox on mini PC hardware
- separate production services from test/dev services
- host lightweight infrastructure services
- evaluate backup and restore workflows
- document service placement and resource allocation

---

## Future Service Ideas 🧪

Potential future additions:

- internal documentation/wiki
- uptime/status page
- centralized log collection
- lightweight ticket or inventory tooling
- media service testing
- self-hosted development environments
- additional automation scripts
- secure remote support tooling

---

## Long-Term Goal 🎯

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
