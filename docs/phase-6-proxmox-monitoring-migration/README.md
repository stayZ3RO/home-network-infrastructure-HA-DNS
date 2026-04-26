# Phase 6 — Proxmox Host Environment & Monitoring Stack Migration 🖥️

## 📖 Summary

Phase 6 adds a dedicated virtualization layer to the home infrastructure lab using Proxmox.

The main goal of this phase was to move the monitoring stack away from the gaming PC / Docker Desktop setup and into a more reliable, always-on virtualized environment.

The monitoring stack was migrated from:

```text
Gaming PC
  ↓
Docker Desktop
  ↓
Monitoring Containers
```

to:

```text
Proxmox Host
  ↓
Ubuntu VM
  ↓
Docker Engine
  ↓
Docker Compose Monitoring Stack
```

---

## 🎯 Goals

The goals of this phase were to:

- deploy a Proxmox host environment
- create an Ubuntu VM for infrastructure services
- install Docker on the Ubuntu VM
- migrate the existing monitoring stack from the gaming PC
- preserve Grafana dashboards and Prometheus configuration
- restore Alertmanager and Discord alerting
- validate that monitoring continued to work after migration
- remove dependency on the gaming PC for always-on monitoring

---

## 🧱 Services Migrated

The following services were migrated to the Ubuntu VM:

- Grafana
- Prometheus
- Alertmanager
- Blackbox Exporter

---

## 📸 Key Result

The monitoring stack now runs from an Ubuntu VM hosted on Proxmox.

![Monitoring containers running on VM](../../screenshots/phase-6/10-monitoring-containers-running-on-vm.png)

![Grafana accessible from VM IP](../../screenshots/phase-6/11-grafana-accessible-from-vm-ip.png)

---

## 📚 Documentation

- [Overview](./overview.md)
- [Step-by-Step Guide](./step-by-step.md)
- [Validation](./validation.md)
- [Diagrams](./diagrams.md)
