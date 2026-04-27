# Phase 6 Diagrams — Proxmox Infrastructure & Omada Network Foundation

## Purpose

This document shows the infrastructure changes completed during Phase 6.

Phase 6 moved supporting services from the gaming PC to the Proxmox host, introduced the Omada Controller, prepared the ER605 router, and pre-staged the managed switch for the Phase 7 cutover.

---

## Phase 6 Architecture Diagram

![Phase 6 Proxmox and Omada Foundation](../../diagrams/phase-6-proxmox-omada-foundation.png)

---

## Before Phase 6

Before this phase, monitoring depended on the gaming PC.

```text
Gaming PC
└── Docker Desktop / WSL
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter
```

Limitations:

- Gaming PC had to remain powered on
- Docker Desktop was part of the monitoring dependency chain
- Monitoring was not hosted on dedicated infrastructure
- Backup and recovery were less centralized

---

## After Phase 6

After this phase, monitoring and network management services run from the Proxmox host.

```text
OptiPlex / Proxmox Host - 192.168.68.80
├── Omada Controller LXC - 192.168.68.10
│   └── Omada Software Controller
│
└── Ubuntu Docker VM - 192.168.68.81
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter
```

---

## Phase 6 Infrastructure Diagram

```text
Home Network - 192.168.68.0/24

Gateway / Router
└── 192.168.68.1

Pi-hole HA DNS
├── Pi-hole VIP - 192.168.68.20
├── ashPi-1 - 192.168.68.60
└── ashPi-2 - 192.168.68.61

Proxmox Infrastructure
└── Proxmox Host - 192.168.68.80
    ├── Omada Controller LXC - 192.168.68.10
    └── Docker Monitoring VM - 192.168.68.81
        ├── Grafana
        ├── Prometheus
        ├── Alertmanager
        └── Blackbox Exporter

Managed Switch
├── Temporary staging IP - 192.168.68.59
└── Planned final IP - 192.168.68.2

DHCP Range
└── 192.168.68.100-192.168.68.200
```

---

## Storage Layout

```text
Proxmox Host - 192.168.68.80
├── SSD-backed storage
│   ├── Active VMs
│   ├── Active LXCs
│   └── Running workloads
│
└── hdd-storage
    ├── VM backups
    ├── LXC backups
    ├── ISO images
    ├── templates
    └── archives
```

---

## ER605 Preconfiguration

The ER605 was preconfigured before being inserted into the live network path.

```text
ER605 Router
├── LAN IP: 192.168.68.1
├── Subnet: 192.168.68.0/24
├── DHCP Range: 192.168.68.100-192.168.68.200
└── DNS: 192.168.68.20
```

This keeps the Pi-hole VIP as the DNS target.

---

## Managed Switch Pre-Staging

The managed switch was adopted into Omada before the Phase 7 cutover.

```text
Managed Switch
├── Temporary staging IP: 192.168.68.59
├── Planned final management IP: 192.168.68.2
├── Controller: 192.168.68.10
└── VLAN State: Default LAN / VLAN 1 only
```

During Phase 6, the switch was validated on the existing flat LAN.

During Phase 7, the switch will become the core switch.

During Phase 8, VLAN segmentation will be configured.

---

## Monitoring Migration Flow

```text
Before:

Gaming PC
└── Docker Desktop
    └── Monitoring Stack

Migration:

Gaming PC
├── Export Compose files
├── Export Docker volumes
└── Copy backups to Ubuntu Docker VM

After:

Proxmox Host
└── Ubuntu Docker VM - 192.168.68.81
    └── Monitoring Stack
```

---

## Current Monitoring Access

```text
Grafana
└── http://192.168.68.81:3000
```

Prometheus, Alertmanager, and Blackbox Exporter continue to support the monitoring stack inside Docker.

---

## Next Phase Target

The next major network cutover will place the ER605 and managed switch into the live network path.

```text
AT&T Gateway / ONT
        ↓
ER605 Omada Router
        ↓
Managed Switch
        ↓
Main Deco in AP Mode
        ↓
Satellite Decos via wireless backhaul
        ↓
Client Devices
```

Expected next-phase responsibilities:

- ER605 handles routing
- ER605 handles DHCP
- ER605 hands out Pi-hole VIP as DNS
- Managed switch becomes the core switch
- Deco mesh provides Wi-Fi only in AP mode
- Pi-hole HA DNS remains active
- VLAN segmentation comes later

---

## Future VLAN Segmentation Target

Once the ER605 and managed switch cutover is stable, the network can move toward VLAN segmentation.

```text
ER605 Router
        ↓
Managed Switch
├── VLAN 10 - Management
├── VLAN 20 - Production
├── VLAN 30 - Lab
└── VLAN 40 - IoT / Guest
```

This will be documented in Phase 8.
