# Phase 6.5 Diagrams: RustDesk Remote Access & VM Hardening 🗺️

---

## Quick Navigation

| Page | Link |
|---|---|
| Phase Home | [README](README.md) |
| Overview | [overview.md](overview.md) |
| Step-by-Step Guide | [step-by-step.md](step-by-step.md) |
| Validation | [validation.md](validation.md) |
| Diagrams | [diagrams.md](diagrams.md) |
| Documentation Hub | [docs/](../README.md) |

---


## Final Pre-Cutover Service Layout

```text
Proxmox Host - 192.168.68.80
├── CT 180: omada-controller - 192.168.68.10
├── VM 183: rustdesk-server - 192.168.68.83
│   ├── rustdesk-hbbs
│   ├── rustdesk-hbbr
│   └── UFW LAN-only firewall
└── VM 281: docker-monitoring - 192.168.68.81
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    ├── Blackbox Exporter
    └── Portainer Agent
```

---

## RustDesk Access Flow

```text
Laptop / Gaming PC / Phone
        ↓
RustDesk Client
        ↓
rustdesk-server - 192.168.68.83
        ├── hbbs
        └── hbbr
```

---

## Docker Management Plan

```text
Future docker-apps VM - 192.168.68.82
└── Portainer Server
    ↓
docker-monitoring VM - 192.168.68.81
└── Portainer Agent - 9001
```

---

## Project Boundary

This phase closes the remote access and VM hardening work for Project 1.

Network segmentation, VLANs, and the managed router/switch production cutover will be handled in a separate project.
