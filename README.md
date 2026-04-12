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

---

## 📡 Current State

* ISP routing removed (IP Passthrough enabled)
* Deco mesh system acting as primary router
* Centralized DNS via Pi-hole
* Network-wide ad blocking active
* DNS query visibility enabled
* Fiber connection integrated via ONT
* Secondary Pi-hole node added for redundancy
* Gravity Sync configured for Pi-hole replication
* keepalived configured for VIP-based DNS failover
* Unbound configured on both Pi-hole nodes
* DNS failover and recursive resolution successfully tested

---

## 🧱 Current Progress

* ✅ Phase 1 — Network Control
* ✅ Phase 1.5 — ISP Migration (AT&T Fiber)
* ✅ Phase 2 — DNS Control (Pi-hole)
* ✅ Phase 3 — High Availability DNS
* ⬜ Phase 4 — Monitoring & Alerting
* ⬜ Phase 5 — Remote Access

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
* [Phase 3 – Validation and Failover Tests](docs/phase-3-ha-dns/validation-and-failover-tests.md)
* [Phase 3 – Diagrams](docs/phase-3-ha-dns/diagrams.md)

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
* Desktop (Control Node)
* Laptop (Test Node)
* Raspberry Pi 1 (Primary DNS Node)
* Raspberry Pi 2 (Secondary DNS Node)

---

## 🧠 What This Project Demonstrates

* Network architecture design
* Infrastructure ownership
* High availability concepts
* DNS redundancy and failover
* Recursive DNS with Unbound
* Observability and monitoring preparation
* Real-world troubleshooting

---

## 🧭 How to Navigate This Project

* Start with the README for an overview
* Review each phase overview for design decisions
* Follow step-by-step guides to replicate setup
* Use screenshots for validation

---

## 📐 Documentation Structure

Each phase includes:

### Overview

* What changed
* Why it matters
* Lessons learned

### Step-by-Step

* Exact setup
* Order of operations
* Validation checkpoints

### Screenshots

* Proof of implementation
* UI validation
* Before/after states
* Failover evidence

---

## 🎯 Goal

To build a home lab that simulates **real-world infrastructure engineering**, covering networking, DNS, monitoring, and secure remote access.

---

## 🚀 Next Step

Phase 4 will introduce **monitoring and alerting**, including:

* Node and service health visibility
* DNS service monitoring
* Resource usage tracking
* Alerting and validation logic
* Better operational visibility before VLANs and segmentation

---

## 🛣️ Long-Term Roadmap

After monitoring and remote access are complete, the next major network evolution will include:

* Managed switching
* VLANs and segmentation
* Guest / trusted / admin separation
* Inter-network policy control
* A more production-style security model
