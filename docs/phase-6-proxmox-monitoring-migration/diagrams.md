# Phase 6 — Proxmox and Monitoring Migration Diagrams 🧭

## 📖 Purpose

This document provides visual architecture references for the Phase 6 Proxmox and monitoring migration.

---

## Before Migration

```text
Gaming PC
  ↓
Docker Desktop
  ↓
Monitoring Stack
  ├── Grafana
  ├── Prometheus
  ├── Alertmanager
  └── Blackbox Exporter
```

### Limitations

- monitoring depended on the gaming PC
- Docker Desktop had to stay running
- rebooting or shutting down the PC impacted monitoring
- personal workstation workloads were mixed with infrastructure services

---

## After Migration

```text
Proxmox Host
  ↓
Ubuntu Monitoring VM
  ↓
Docker Engine
  ↓
Docker Compose
  ↓
Monitoring Stack
  ├── Grafana
  ├── Prometheus
  ├── Alertmanager
  └── Blackbox Exporter
```

### Improvements

- monitoring moved to a dedicated VM
- gaming PC is no longer required for monitoring uptime
- Docker runs on Linux instead of Docker Desktop
- infrastructure services are better separated
- future services can be hosted on Proxmox

---

## Monitoring Data Flow

```text
ashpi-1 Node Exporter
ashpi-2 Node Exporter
DNS VIP Probe
Direct Pi-hole DNS Probes
        ↓
Prometheus
        ↓
Grafana Dashboards
        ↓
Alertmanager
        ↓
Discord Alerts
```

---

## HA DNS Monitoring Path

```text
Clients
  ↓
DNS VIP: 192.168.68.20
  ↓
Active Pi-hole Node
  ↓
Unbound Resolver

Monitoring VM
  ↓
Blackbox Exporter
  ↓
DNS Probe to VIP and Pi-hole Nodes
  ↓
Prometheus
  ↓
Grafana / Alertmanager
```

---

## Final Phase 6 Architecture

```text
AT&T Fiber
  ↓
AT&T Gateway / IP Passthrough
  ↓
Deco Mesh Router
  ↓
Home LAN
  ├── ashpi-1
  │   ├── Pi-hole
  │   ├── Unbound
  │   ├── keepalived
  │   └── Node Exporter
  │
  ├── ashpi-2
  │   ├── Pi-hole
  │   ├── Unbound
  │   ├── keepalived
  │   └── Node Exporter
  │
  └── Proxmox Host
      ↓
      Ubuntu Monitoring VM
      ├── Grafana
      ├── Prometheus
      ├── Alertmanager
      └── Blackbox Exporter
```

---

## 🏁 Result

The Phase 6 architecture moves monitoring from a workstation-dependent setup into a dedicated Proxmox-hosted infrastructure service.
