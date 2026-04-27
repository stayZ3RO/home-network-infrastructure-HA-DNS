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

## Key Result

The monitoring stack now runs from an Ubuntu VM hosted on Proxmox instead of Docker Desktop on the gaming PC.

This phase also introduced the Omada Software Controller as an LXC container and preconfigured the ER605 router for the next network cutover.

### Supporting Screenshots

![Proxmox node summary](../../screenshots/phase-6/03-proxmox-node-summary.png)

![Omada Controller dashboard](../../screenshots/phase-6/04-omada-controller-dashboard.png)

![ER605 LAN DHCP Pi-hole DNS configuration](../../screenshots/phase-6/06-er605-lan-dhcp-pihole-dns.png)

![Docker Compose monitoring stack running](../../screenshots/phase-6/08-docker-compose-monitoring-running.png)

![Grafana running from Docker VM](../../screenshots/phase-6/09-grafana-running-from-docker-vm.png)
---

## Documentation

- [Overview](./overview.md)
- [Step-by-Step Guide](./step-by-step.md)
- [Validation](./validation.md)
- [Diagrams](./diagrams.md)
- [Screenshots](./screenshots.md)
