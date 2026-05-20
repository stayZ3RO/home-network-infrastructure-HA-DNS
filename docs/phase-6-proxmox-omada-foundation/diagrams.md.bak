# Phase 6 Diagrams — Proxmox, Omada & Docker Monitoring Foundation 🗺️

## Purpose

This document captures the architecture change introduced in Phase 6.

---

## Phase 6 Logical Architecture

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
```

---

## Monitoring Migration Flow

```text
Before:
Gaming PC
└── Docker Desktop
    └── Monitoring Stack

Migration:
Export compose files and Docker volumes
Copy backups to Docker VM
Restore volumes
Start stack on Docker VM

After:
Proxmox Host
└── Docker Monitoring VM
    └── Monitoring Stack
```

---

## Cutover Preparation Boundary

Phase 6 prepared the infrastructure foundation.

It did not perform the live router/switch cutover or VLAN segmentation. Those items are intentionally moved to the separate network segmentation project.
