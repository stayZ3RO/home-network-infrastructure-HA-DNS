# Phase 6 — Validation

## Purpose

This document captures the validation steps used to confirm Phase 6 was successful.

Validation focused on:

- Proxmox host readiness
- Omada Controller LXC deployment
- ER605 router preconfiguration
- Docker monitoring VM readiness
- monitoring stack migration
- Grafana access from the new VM IP
- Proxmox backup coverage
- removal of the gaming PC dependency

---

## Validation 1 — Proxmox Host Online

### Expected Result

The Proxmox host should be reachable through the web interface and show healthy node status.

### Result

Passed ✅

![Proxmox node summary](../../screenshots/phase-6/03-proxmox-node-summary.png)

---

## Validation 2 — Proxmox Storage Layout

### Expected Result

The Proxmox host should have storage available for active workloads and backup storage.

### Result

Passed ✅

![Proxmox storage layout](../../screenshots/phase-6/02-proxmox-storage-layout.png)

---

## Validation 3 — Omada Controller LXC Running

### Expected Result

The Omada Controller should run from an LXC container on Proxmox.

### Result

Passed ✅

![Omada LXC package installation](../../screenshots/phase-6/01-omada-lxc-package-install.jpeg)

![Omada Controller dashboard](../../screenshots/phase-6/04-omada-controller-dashboard.png)

---

## Validation 4 — ER605 Router Preconfigured

### Expected Result

The ER605 router should be preconfigured with the existing LAN IP plan before the physical cutover.

### Expected Configuration

| Setting | Value |
|---|---|
| LAN IP | `192.168.xx.x` |
| Subnet Mask | `255.255.255.0` |
| DHCP Range | `192.xxx.xx.xxx-192.xxx.xxx.xxx` |
| Primary DNS | `192.168.xx.xx` |

### Result

Passed ✅

![ER605 address reservations](../../screenshots/phase-6/05-er605-address-reservations.png)

![ER605 LAN DHCP Pi-hole DNS](../../screenshots/phase-6/06-er605-lan-dhcp-pihole-dns.png)

---

## Validation 5 — Docker Monitoring VM Online

### Expected Result

The Ubuntu Docker VM should run on Proxmox and host the migrated monitoring stack.

### Result

Passed ✅

![Docker VM summary](../../screenshots/phase-6/07-docker-vm-summary.png)

---

## Validation 6 — Monitoring Stack Running

### Expected Result

The migrated monitoring containers should run successfully on the Ubuntu Docker VM.

### Expected Containers

- Grafana
- Prometheus
- Alertmanager
- Blackbox Exporter

### Result

Passed ✅

![Docker Compose monitoring stack running](../../screenshots/phase-6/08-docker-compose-monitoring-running.png)

---

## Validation 7 — Grafana Accessible from Docker VM

### Expected Result

Grafana should be reachable from the LAN using the Docker VM IP address.

### URL

```text
http://192.xxx.xx.xx:3000
