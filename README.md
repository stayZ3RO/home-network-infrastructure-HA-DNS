# Home Network Infrastructure Lab 🚀

### Building a Production-Style Home Network with HA DNS, Monitoring, Alerting, and Secure Access

---

## 📖 About This Project

This project documents the process of building a **self-managed home network infrastructure lab** from the ground up.

Instead of relying on ISP-managed networking, the goal is to design a system that mirrors **real-world infrastructure environments**, including:

- custom routing and network control
- centralized DNS management
- high availability DNS architecture
- recursive DNS resolution
- observability and monitoring
- alerting and notification routing
- secure remote access

Each phase builds toward a more resilient, observable, and production-like infrastructure environment.

---

## 🧭 Architecture Overview

Core DNS path:

```text
Internet
  ↓
AT&T Fiber
  ↓
ONT
  ↓
AT&T Gateway / IP Passthrough
  ↓
Deco Mesh Router
  ↓
Clients
  ↓
HA Pi-hole VIP
  ↓
Active Pi-hole Node
  ↓
Local Unbound Resolver
```

Monitoring and alerting path:

```text
Node Exporter / Blackbox Exporter
  ↓
Prometheus
  ↓
Grafana Dashboards
  ↓
Alertmanager
  ↓
Discord Alerts
```

Remote administration path:

```text
Gaming PC / Laptop / Phone
  ↓
Tailscale Tailnet
  ↓
ashpi-1 / ashpi-2
```

---

## 📡 Current State

- ISP routing removed through AT&T IP Passthrough
- Deco mesh system acting as primary router
- Centralized DNS via Pi-hole
- Network-wide ad blocking active
- DNS query visibility enabled
- Fiber connection integrated through ONT
- High availability DNS implemented with dual Pi-hole nodes
- Gravity Sync configured for Pi-hole replication
- keepalived configured for VIP-based failover
- Unbound configured on both Pi-hole nodes
- Prometheus, Grafana, Alertmanager, and Blackbox Exporter deployed for observability
- Node Exporter configured on both Raspberry Pi nodes
- DNS failover and monitoring validations completed successfully
- Discord alert delivery configured through Alertmanager
- Discord webhook stored locally as a secret and excluded from Git
- Secure remote administrative access implemented with Tailscale
- Remote SSH access to both Pi nodes validated from outside the home network
- No public SSH port forwarding required- Proxmox host environment deployed for virtualization
- Ubuntu monitoring VM created under Proxmox
- Monitoring stack migrated from gaming PC / Docker Desktop to Ubuntu VM / Docker Engine
- Grafana, Prometheus, Alertmanager, and Blackbox Exporter restored on the VM
- Monitoring no longer depends on the gaming PC being powered on

---

## 🧱 Current Progress

- ✅ Phase 1 — Network Control
- ✅ Phase 1.5 — ISP Migration / AT&T Fiber
- ✅ Phase 2 — DNS Control / Pi-hole
- ✅ Phase 3 — High Availability DNS
- ✅ Phase 4 — Monitoring & Alerting
- ✅ Phase 5 — Remote Access
- ✅ Phase 6 — Proxmox Host Environment & Monitoring Migration

---

## 📚 Documentation

### Phase 1 — Network Control

- [Phase 1 – Network Control Overview](docs/phase-1-network-control/overview.md)
- [Phase 1 – Step-by-Step Guide](docs/phase-1-network-control/step-by-step.md)

### Phase 1.5 — ISP Migration

- [Phase 1.5 – ISP Migration Overview](docs/phase-1.5-isp-migration/overview.md)
- [Phase 1.5 – Step-by-Step Guide](docs/phase-1.5-isp-migration/step-by-step.md)

### Phase 2 — DNS Control

- [Phase 2 – DNS Control Overview](docs/phase-2-dns-control/overview.md)
- [Phase 2 – Step-by-Step Guide](docs/phase-2-dns-control/step-by-step.md)

### Phase 3 — High Availability DNS

- [Phase 3 – HA DNS Overview](docs/phase-3-ha-dns/overview.md)
- [Phase 3 – Step-by-Step Guide](docs/phase-3-ha-dns/step-by-step.md)
- [Phase 3 – Jump Box Access](docs/phase-3-ha-dns/jump-box-access.md)
- [Phase 3 – Validation and Failover Tests](docs/phase-3-ha-dns/validation-and-failover-tests.md)
- [Phase 3 – Diagrams](docs/phase-3-ha-dns/diagrams.md)
- [Phase 3 – DNS Recursion with Unbound](docs/phase-3-ha-dns/DNS-recursion-unbound.md)

### Phase 4 — Monitoring & Alerting

- [Phase 4 – Monitoring & Alerting Overview](docs/phase-4-monitoring-alerting/overview.md)
- [Phase 4 – Step-by-Step Guide](docs/phase-4-monitoring-alerting/step-by-step.md)
- [Phase 4 – Dashboards](docs/phase-4-monitoring-alerting/dashboards.md)
- [Phase 4 – Alerting](docs/phase-4-monitoring-alerting/alerting.md)
- [Phase 4 – Validation](docs/phase-4-monitoring-alerting/validation.md)

### Phase 5 — Remote Access

- [Phase 5 – Remote Access Overview](docs/phase-5-remote-access/overview.md)
- [Phase 5 – Step-by-Step Guide](docs/phase-5-remote-access/step-by-step.md)
- [Phase 5 – Validation](docs/phase-5-remote-access/validation.md)

### Phase 6 — Proxmox Host Environment & Monitoring Migration

- [Phase 6 – Overview](docs/phase-6-proxmox-monitoring-migration/overview.md)
- [Phase 6 – Step-by-Step Guide](docs/phase-6-proxmox-monitoring-migration/step-by-step.md)
- [Phase 6 – Validation](docs/phase-6-proxmox-monitoring-migration/validation.md)
- [Phase 6 – Diagrams](docs/phase-6-proxmox-monitoring-migration/diagrams.md)

---

## 🗺️ Network Diagram

![Network Architecture](diagrams/network-architecture-phase-3.png)

---

## 🖥️ Hardware and Lab Systems

- AT&T Fiber connection
- ONT / Optical Network Terminal
- AT&T Gateway with IP Passthrough
- TP-Link Deco X25 Mesh System
- D-Link 16-Port Switch
- Gaming PC / monitoring and admin endpoint
- Docker monitoring host / VM
- Laptop / remote admin and test endpoint
- Raspberry Pi 1 — `ashpi-1`
- Raspberry Pi 2 — `ashpi-2`

---

## 🧰 Core Tools and Services

- Pi-hole
- Gravity Sync
- keepalived
- Unbound
- Prometheus
- Grafana
- Alertmanager
- Blackbox Exporter
- Node Exporter
- Discord webhooks
- Tailscale
- Docker Compose

---

## 🧠 What This Project Demonstrates

- Network architecture design
- Infrastructure ownership
- DNS control and filtering
- High availability concepts
- DNS redundancy and failover
- Recursive DNS with Unbound
- Host and service monitoring
- Alerting with reduced noise
- Alertmanager notification routing
- Secret handling for webhook-based alerts
- Secure remote administration
- Real-world troubleshooting and validation
- GitHub-based technical documentation
- virtualization with Proxmox
- service migration from workstation Docker Desktop to Linux VM Docker Engine
- infrastructure service separation

---

## 🧭 How to Navigate This Project

- Start with this README for a full project overview
- Review each phase overview for design decisions and architecture updates
- Use the step-by-step guides to follow implementation order
- Use screenshots and validation documents as proof of successful deployment
- Review the changelog and lessons learned to understand how the environment evolved
- Use the roadmap to see the next planned infrastructure layers

---

## 📐 Documentation Structure

Each phase generally includes:

### Overview

- what changed
- why it matters
- architecture updates
- lessons learned

### Step-by-Step

- setup process
- order of operations
- validation checkpoints

### Validation

- proof of successful implementation
- failure and recovery testing
- screenshots showing expected behavior

### Screenshots

- proof of implementation
- UI validation
- before/after states
- failover, monitoring, alerting, and remote access evidence

---

## 🔐 Security Notes

- No SSH services are exposed to the public internet
- Remote administration is handled through Tailscale
- Monitoring services are kept LAN-only
- Discord webhook secrets are stored locally and excluded from Git
- No router port forwarding is required for remote administration

---

## 🎯 Goal

To build a home lab that simulates **real-world infrastructure engineering**, covering networking, DNS, high availability, monitoring, alerting, secure access, and documentation.

---

## 🚀 Next Step

With the first five phases complete, the next major evolution is:

- managed switching
- VLAN segmentation
- trusted / guest / IoT network separation
- tighter policy control between networks
- migration of monitoring to a dedicated always-on host
- deeper infrastructure services on future mini workstation / Proxmox nodes

---

## 🛣️ Long-Term Roadmap

After completing remote access, the next infrastructure layer will focus on:

- managed switching
- VLAN segmentation
- admin / trusted / guest / IoT separation
- inter-network access policy design
- more dedicated management infrastructure
- future virtualization and service expansion
