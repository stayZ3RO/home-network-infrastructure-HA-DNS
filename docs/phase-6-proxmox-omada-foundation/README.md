# Phase 6 — Proxmox, Omada & Docker Monitoring Foundation 🧱

![status](https://img.shields.io/badge/status-complete-brightgreen)
![platform](https://img.shields.io/badge/platform-Proxmox-orange)
![controller](https://img.shields.io/badge/controller-Omada-0ea5e9)
![runtime](https://img.shields.io/badge/runtime-Docker-blue)
![monitoring](https://img.shields.io/badge/monitoring-Grafana%20%2B%20Prometheus-f46800)

---

## Phase Summary

Phase 6 added a dedicated infrastructure layer to the lab.

The monitoring stack was moved away from the gaming PC and into a Proxmox-hosted Docker VM. The Omada Controller was also deployed as an LXC so network management could live on the infrastructure host.

---

## What This Phase Demonstrates

| Area | Demonstrated Skill |
|---|---|
| Virtualization | Proxmox host for infrastructure workloads |
| Controller hosting | Omada Controller in an LXC |
| Docker operations | Monitoring stack migrated into a Linux VM |
| Service separation | Monitoring removed from workstation dependency |
| Backup readiness | Proxmox backups captured |
| Cutover prep | ER605 and managed switch pre-staged for future project |

---

## Service Layout

```text
Proxmox Host - 192.168.68.80
├── Omada Controller LXC - 192.168.68.10
└── Docker Monitoring VM - 192.168.68.81
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter
```

![Phase 6 Proxmox service migration diagram](../../diagrams/07-phase-6-proxmox-service-migration.png)

---

## Current IP Plan

| Device / Service | IP Address | Purpose |
|---|---:|---|
| Gateway / existing LAN | `192.168.68.1` | Default gateway at this project stage |
| Omada Controller LXC | `192.168.68.10` | Omada software controller |
| Pi-hole VIP | `192.168.68.20` | HA DNS endpoint |
| ashpi-1 | `192.168.68.60` | Pi-hole / Unbound node 1 |
| ashpi-2 | `192.168.68.61` | Pi-hole / Unbound node 2 |
| Proxmox Host | `192.168.68.80` | Virtualization host |
| Docker Monitoring VM | `192.168.68.81` | Monitoring stack |
| RustDesk VM | `192.168.68.83` | Remote access VM added in Phase 6.5 |
| DHCP Range | `192.168.68.100-200` | Client devices |

---

## Phase Documentation

| Page | Description |
|---|---|
| [Overview](./overview.md) | Proxmox and service migration case study |
| [Step-by-Step Guide](./step-by-step.md) | Implementation flow |
| [Validation](./validation.md) | Validation evidence |
| [Diagrams](./diagrams.md) | Phase architecture |
| [Managed Switch Pre-Staging](./managed-switch-prep.md) | Switch adoption and pre-cutover validation |

---

## Outcome

The lab gained a dedicated virtualization platform, a hosted network controller, and an always-on monitoring VM.

This phase prepared the environment for later network segmentation work without making that cutover part of this repository.
