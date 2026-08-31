# Phase 6 Overview: Proxmox, Omada & Docker Monitoring Foundation 🧱

## 📌 Purpose

Phase 6 built the dedicated infrastructure layer for the home lab.

Before this phase, the monitoring stack depended on the gaming PC running Docker Desktop. That was useful for initial validation, but it was not ideal for always-on infrastructure.

This phase moved monitoring and network management into Proxmox.

---

## 🎯 Phase Goals

- Deploy Proxmox on the Dell OptiPlex
- Host Omada Controller in an LXC container
- Migrate monitoring from the gaming PC to a Docker VM
- Preconfigure the ER605 router
- Adopt and test the managed switch
- Preserve the Pi-hole HA DNS design
- Create Proxmox backup coverage
- Prepare for remote access and future cutover work

---

## 🔴 Before Phase 6

```text
Gaming PC
└── Docker Desktop / WSL
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter
```

Limitations:

- Monitoring depended on a personal workstation
- Docker Desktop had to stay running
- Backups were less centralized
- The lab lacked a dedicated service host

---

## 🟢 After Phase 6

```text
Proxmox Host - 192.168.68.80
├── Omada Controller LXC - 192.168.68.10
└── Docker Monitoring VM - 192.168.68.81
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter
```

The gaming PC is no longer required for always-on monitoring.

---

## 🌐 IP Plan

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
| DHCP Range | `192.168.68.100-200` | Client devices |

---

## 🧠 Infrastructure Decisions

### Why Proxmox?

Proxmox provides a dedicated virtualization layer for running core services independently from a personal workstation.

### Why Omada Controller as LXC?

The Omada Controller runs efficiently in an LXC and avoids needing a separate hardware controller.

### Why a Docker Monitoring VM?

The monitoring stack is easier to manage, back up, and migrate when isolated inside a dedicated Docker VM.

### Why pre-stage the switch?

Adopting and validating the switch before cutover reduces risk during the live network migration.

---

## 🧪 Screenshot Evidence

![Proxmox node summary](../../screenshots/phase-6/03-proxmox-node-summary.jpeg)

![Omada Controller dashboard](../../screenshots/phase-6/04-omada-controller-dashboard.jpeg)

![Docker Compose monitoring stack running](../../screenshots/phase-6/08-docker-compose-monitoring-running.png)

![Grafana running from Docker VM](../../screenshots/phase-6/09-grafana-running-from-docker-vm.png)

---

## ✅ Final Result

Phase 6 created the service foundation required to close out the HA DNS infrastructure project and prepare for future segmentation work.
