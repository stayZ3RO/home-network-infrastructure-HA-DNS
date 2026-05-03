# Phase 6 — Proxmox, Omada & Docker Monitoring Foundation 🧱

## 📌 Overview

Phase 6 introduced the dedicated infrastructure layer for the lab.

The goal was to move always-on services away from the gaming PC and onto a dedicated Proxmox host. This gave the environment a cleaner foundation for monitoring, network management, backups, and future router/switch cutover work.

By the end of this phase, the lab had:

- A dedicated Proxmox host
- An Omada Controller LXC
- A Docker monitoring VM
- ER605 router preconfiguration
- Managed switch pre-staging
- Proxmox backup coverage

---

## 🎯 Objectives

The goals for this phase were to:

- deploy Proxmox on the Dell OptiPlex
- create a dedicated infrastructure host
- host the Omada Controller in an LXC container
- migrate monitoring from the gaming PC to a Docker VM
- preconfigure the ER605 router before live cutover
- adopt and validate the managed switch before VLAN work
- preserve the existing Pi-hole HA DNS design
- create backup coverage for core lab services

---

## 🧩 What Was Built

| Component | Role | Status |
|---|---|---|
| Proxmox Host | Virtualization platform for core services | Complete |
| Omada Controller LXC | Network controller for TP-Link Omada devices | Complete |
| Docker Monitoring VM | Grafana, Prometheus, Alertmanager, Blackbox Exporter | Complete |
| ER605 Router | Preconfigured for future gateway cutover | Complete |
| Managed Switch | Adopted and tested before cutover | Complete |
| Proxmox Backups | Backup target on `hdd-storage` | Complete |

---

## 🌐 Current IP Plan

| Device / Service | IP Address | Purpose |
|---|---:|---|
| Gateway / Future ER605 LAN | `192.168.68.1` | Default gateway |
| Managed Switch | `192.168.68.59` temporary / `192.168.68.2` planned | Switch pre-staging and future core switch |
| Omada Controller LXC | `192.168.68.10` | Omada software controller |
| Pi-hole VIP | `192.168.68.20` | HA DNS endpoint |
| ashPi-1 | `192.168.68.60` | Pi-hole / Unbound node 1 |
| ashPi-2 | `192.168.68.61` | Pi-hole / Unbound node 2 |
| Proxmox Host | `192.168.68.80` | Virtualization host |
| Docker Monitoring VM | `192.168.68.81` | Monitoring stack |
| RustDesk VM | `192.168.68.83` | Remote access VM introduced in Phase 6.5 |
| DHCP Range | `192.168.68.100-200` | Client devices |

---

## 🏗️ Final Phase 6 Architecture

```text
OptiPlex / Proxmox Host - 192.168.68.80
├── Omada Controller LXC - 192.168.68.10
│   └── Omada Software Controller
│
└── Docker Monitoring VM - 192.168.68.81
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter

Managed Switch
├── Temporary staging IP: 192.168.68.59
└── Planned final management IP: 192.168.68.2
```

---

## 🔁 Before vs After

### Before Phase 6

```text
Gaming PC
└── Docker Desktop / WSL
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter
```

### After Phase 6

```text
Proxmox Host
├── Omada Controller LXC
└── Docker Monitoring VM
    └── Monitoring stack
```

This removed the gaming PC as an infrastructure dependency.

---

## 🧪 Validation Evidence

### Proxmox Host

![Proxmox node summary](../../screenshots/phase-6/03-proxmox-node-summary.jpeg)

### Omada Controller

![Omada Controller dashboard](../../screenshots/phase-6/04-omada-controller-dashboard.jpeg)

### ER605 Router Preconfiguration

![ER605 address reservations](../../screenshots/phase-6/05-er605-address-reservations.jpeg)

![ER605 LAN DHCP Pi-hole DNS](../../screenshots/phase-6/06-er605-lan-dhcp-pihole-dns.jpeg)

### Docker Monitoring VM

![Docker VM summary](../../screenshots/phase-6/07-docker-vm-summary.png)

![Docker Compose monitoring stack running](../../screenshots/phase-6/08-docker-compose-monitoring-running.png)

![Grafana running from Docker VM](../../screenshots/phase-6/09-grafana-running-from-docker-vm.png)

### Proxmox Backup

![Proxmox backup to hdd-storage](../../screenshots/phase-6/10-proxmox-backup-to-hdd-storage.png)

### Gaming PC No Longer Hosting Monitoring

![Gaming PC Docker stopped](../../screenshots/phase-6/11-gaming-pc-docker-stopped.png)

### Managed Switch Pre-Staging

![Switch adopted in Omada](../../screenshots/phase-6/switch-prep/02-switch-adopted-in-omada.png)

![Client test through managed switch](../../screenshots/phase-6/switch-prep/05-client-test-through-managed-switch.png)

---

## 📚 Documentation

- [Overview](./overview.md)
- [Step-by-Step Guide](./step-by-step.md)
- [Validation](./validation.md)
- [Diagrams](./diagrams.md)
- [Managed Switch Pre-Staging](./managed-switch-prep.md)

---

## ✅ Phase Result

Phase 6 successfully created the virtualization and management foundation for the lab.

The environment now has dedicated infrastructure for Omada, monitoring, backups, and future network cutover work.

---

## ➡️ Next Phase

Phase 6.5 adds final remote access and VM hardening before the project closeout.

Future router cutover, VLANs, and segmentation will move into a separate network segmentation project.
