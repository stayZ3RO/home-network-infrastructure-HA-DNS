# Home Network Infrastructure Lab 🚀

### Building a Production-Style Home Network with HA DNS, Monitoring, and Secure Access

---

## 📖 About This Project

This project documents the process of building a **self-managed home network infrastructure lab** from the ground up.

Instead of relying on ISP-managed networking, the goal is to design a system that mirrors **real-world infrastructure environments**, including:

* Custom routing and network control
* High availability DNS architecture
* Observability and monitoring
* Secure remote access

Each phase builds toward a more resilient, observable, and production-like infrastructure environment.

---

## 🧭 Architecture Overview

Internet (AT&T Fiber) → ONT → AT&T Gateway (IP Passthrough) → Deco Mesh Router → HA Pi-hole VIP → Active Pi-hole Node → Local Unbound Resolver → Clients

Remote Administration Path:
Gaming PC / Laptop → Tailscale Tailnet → ashpi-1 / ashpi-2

---

## 📡 Current State

* ISP routing removed (IP Passthrough enabled)
* Deco mesh system acting as primary router
* Centralized DNS via Pi-hole
* Network-wide ad blocking active
* DNS query visibility enabled
* Fiber connection integrated via ONT
* High availability DNS implemented with dual Pi-hole nodes
* Gravity Sync configured for Pi-hole replication
* keepalived configured for VIP-based failover
* Unbound configured on both Pi-hole nodes
* Prometheus, Grafana, Alertmanager, and Blackbox Exporter deployed for observability
* Node Exporter configured on both Raspberry Pi nodes
* DNS failover and monitoring validations completed successfully
* Secure remote administrative access implemented with Tailscale
* Remote SSH access to both Pi nodes validated from outside the home network
* No public SSH port forwarding required

---

## 🧱 Current Progress

* ✅ Phase 1 — Network Control
* ✅ Phase 1.5 — ISP Migration (AT&T Fiber)
* ✅ Phase 2 — DNS Control (Pi-hole)
* ✅ Phase 3 — High Availability DNS
* ✅ Phase 4 — Monitoring & Alerting
* ✅ Phase 5 — Remote Access

---

## 📚 Documentation

* [Phase 1 – Network Control Overview](docs/phase-1-network-control/overview.md)
* [Phase 1 – Step-by-Step Guide](docs/phase-1-network-control/step-by-step.md)

* [Phase 1.5 – ISP Migration Overview](docs/phase-1.5-isp-migration/overview.md)
* [Phase 1.5 – Step-by-Step Guide](docs/phase-1.5-isp-migration/step-by-step.md)

* [Phase 2 – DNS Control Overview](docs/phase-2-dns-control/overview.md)
* [Phase 2 – Step-by-Step Guide](docs/phase-2-dns-control/step-by-step.md)

* [Phase 3 – HA DNS Overview](docs/phase-3-ha-dns/overview.md)
* [Phase 3 – Step-by-Step Guide](docs/phase-3-ha-dns/step-by-step.md)
* [Phase 3 – Jump Box Access](docs/phase-3-ha-dns/jump-box-access.md)
* [Phase 3 – DNS Recursion with Unbound](docs/phase-3-ha-dns/DNS-recursion-unbound.md)

* [Phase 4 – Monitoring & Alerting Overview](docs/phase-4-monitoring-alerting/overview.md)
* [Phase 4 – Step-by-Step Guide](docs/phase-4-monitoring-alerting/step-by-step.md)
* [Phase 4 – Dashboards](docs/phase-4-monitoring-alerting/dashboards.md)
* [Phase 4 – Alerting](docs/phase-4-monitoring-alerting/alerting.md)
* [Phase 4 – Validation](docs/phase-4-monitoring-alerting/validation.md)

* [Phase 5 – Remote Access Overview](docs/phase-5-remote-access/overview.md)
* [Phase 5 – Step-by-Step Guide](docs/phase-5-remote-access/step-by-step.md)
* [Phase 5 – Validation](docs/phase-5-remote-access/validation.md)

---

## 🗺️ Network Diagram

![Network Architecture](diagrams/network-architecture-phase-3.png)

---

## 🖥️ Hardware

* AT&T Fiber Connection
* ONT (Optical Network Terminal)
* AT&T Gateway (IP Passthrough)
* TP-Link Deco X25 Mesh System
* D-Link 16-Port Switch
* Gaming PC (temporary monitoring host and admin endpoint)
* Laptop (remote admin and test endpoint)
* Raspberry Pi 1 — `ashpi-1`
* Raspberry Pi 2 — `ashpi-2`

---

## 🧠 What This Project Demonstrates

* Network architecture design
* Infrastructure ownership
* High availability concepts
* DNS redundancy and failover
* Recursive DNS with Unbound
* Host and service monitoring
* Alerting with reduced noise
* Secure remote administration
* Real-world troubleshooting and validation

---

## 🧭 How to Navigate This Project

* Start with the README for a full project overview
* Review each phase overview for design decisions and architecture updates
* Use the step-by-step guides to follow implementation order
* Use screenshots and validation documents as proof of successful deployment
* Review the changelog and lessons learned to understand how the environment evolved

---

## 📐 Documentation Structure

Each phase includes:

### Overview

* What changed
* Why it matters
* Architecture updates
* Lessons learned

### Step-by-Step

* Exact setup
* Order of operations
* Validation checkpoints

### Screenshots

* Proof of implementation
* UI validation
* Before/after states
* Failover, monitoring, and remote access evidence

---

## 🎯 Goal

To build a home lab that simulates **real-world infrastructure engineering**, covering networking, DNS, monitoring, and secure remote access.

---

## 🚀 Next Step

With the first five phases complete, the next major evolution is:

* managed switching
* VLANs and segmentation
* trusted / guest / IoT network separation
* tighter policy control between networks
* migration of monitoring to a dedicated always-on host
* deeper infrastructure services on future mini workstation / Proxmox nodes

---

## 🛣️ Long-Term Roadmap

After completing remote access, the next infrastructure layer will focus on:

* managed switching
* VLAN segmentation
* admin / trusted / guest / IoT separation
* inter-network access policy design
* more dedicated management infrastructure
* future virtualization and service expansion
