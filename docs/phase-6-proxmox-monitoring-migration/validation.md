# Phase 6 — Validation 🧪

## 📖 Purpose

This document captures the validation steps used to confirm the Proxmox migration was successful.

The validation focused on:

- Proxmox host readiness
- Ubuntu VM readiness
- Docker functionality
- monitoring stack startup
- Grafana access
- Prometheus target health
- Blackbox DNS probe health
- Alertmanager and Discord alert delivery
- removal of the gaming PC dependency

---

## Validation 1 — Proxmox Host Online 🖥️

### Expected result

The Proxmox host should be reachable through the web interface and show healthy node status.

### Result

Passed ✅

![Proxmox host dashboard](../../screenshots/phase-6/01-proxmox-host-dashboard.png)

![Proxmox node summary](../../screenshots/phase-6/02-proxmox-node-summary.png)

---

## Validation 2 — Ubuntu Monitoring VM Created 🐧

### Expected result

The Ubuntu monitoring VM should exist, boot successfully, and have assigned resources.

### Result

Passed ✅

![Ubuntu monitoring VM created](../../screenshots/phase-6/03-ubuntu-monitoring-vm-created.png)

![Ubuntu VM hardware resources](../../screenshots/phase-6/04-ubuntu-vm-hardware-resources.png)

![Ubuntu VM console login](../../screenshots/phase-6/05-ubuntu-vm-console-login.png)

---

## Validation 3 — Docker Installed on Ubuntu VM 🐳

### Expected result

Docker and Docker Compose should run successfully inside the Ubuntu VM.

### Commands used

```bash
docker --version
docker compose version
docker ps
```

### Result

Passed ✅

![Docker installed on Ubuntu VM](../../screenshots/phase-6/06-docker-installed-on-ubuntu-vm.png)

---

## Validation 4 — Monitoring Stack Running 🚀

### Expected result

The migrated monitoring containers should run successfully on the Ubuntu VM.

### Expected containers

- Grafana
- Prometheus
- Alertmanager
- Blackbox Exporter

### Result

Passed ✅

![Monitoring containers running on VM](../../screenshots/phase-6/10-monitoring-containers-running-on-vm.png)

---

## Validation 5 — Grafana Accessible from VM IP 📊

### Expected result

Grafana should be reachable from the LAN using the Ubuntu VM IP address.

### Example

```text
http://<monitoring-vm-ip>:3000
```

### Result

Passed ✅

![Grafana accessible from VM IP](../../screenshots/phase-6/11-grafana-accessible-from-vm-ip.png)

---

## Validation 6 — Prometheus Target Health 📡

### Expected result

Prometheus should show healthy scrape targets after migration.

### Query used

```promql
up
```

### Result

Passed ✅

![Prometheus targets up after migration](../../screenshots/phase-6/12-prometheus-targets-up-after-migration.png)

---

## Validation 7 — Blackbox DNS Probe Health 🌐

### Expected result

Blackbox probes should confirm DNS availability for the VIP and direct Pi-hole nodes.

### Query used

```promql
probe_success
```

### Result

Passed ✅

![Blackbox probes healthy after migration](../../screenshots/phase-6/13-blackbox-probes-healthy-after-migration.png)

---

## Validation 8 — Alertmanager and Discord Delivery 🔔

### Expected result

Alertmanager should continue routing alerts to Discord after the migration.

### Validation performed

- confirmed Alertmanager container was running
- confirmed secret file was mounted into the container
- sent manual test alert
- confirmed Discord received the alert

### Result

Passed ✅

![Alertmanager running after migration](../../screenshots/phase-6/14-alertmanager-running-after-migration.png)

![Discord alert test after migration](../../screenshots/phase-6/17-discord-alert-test-after-migration.png)

---

## Validation 9 — Dashboards Restored ✅

### Expected result

The Grafana dashboards should continue showing live data after migration.

### Dashboards validated

- Node Health
- DNS & Failover

### Result

Passed ✅

![Node Health dashboard after migration](../../screenshots/phase-6/15-node-health-dashboard-after-migration.png)

![DNS Failover dashboard after migration](../../screenshots/phase-6/16-dns-failover-dashboard-after-migration.png)

---

## Validation 10 — Gaming PC Dependency Removed 🛑

### Expected result

The old Docker Desktop monitoring stack on the gaming PC should no longer be required.

### Validation performed

- stopped the old monitoring containers on the gaming PC
- confirmed Grafana still worked from the Ubuntu VM
- confirmed Prometheus and Blackbox remained healthy
- confirmed monitoring continued without Docker Desktop

### Result

Passed ✅

![Gaming PC Docker stack stopped](../../screenshots/phase-6/18-gaming-pc-docker-stack-stopped.png)

---

## 🏁 Conclusion

Phase 6 validation confirmed that the monitoring stack successfully moved from the gaming PC to a Proxmox-hosted Ubuntu VM.

The new design provides:

- dedicated virtualized infrastructure
- improved monitoring reliability
- separation from the gaming PC
- continued Grafana dashboard visibility
- continued Prometheus metrics collection
- continued Alertmanager and Discord alerting
- a better foundation for future self-hosted services
