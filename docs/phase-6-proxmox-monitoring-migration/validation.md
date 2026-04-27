# Phase 6 — Validation

## Purpose

This document captures the validation steps used to confirm Phase 6 was successful.

Phase 6 focused on:

- deploying Proxmox on the OptiPlex host
- creating an Omada Controller LXC
- preparing the ER605 router for the next network cutover
- migrating the monitoring stack from the gaming PC to an Ubuntu Docker VM
- validating that the gaming PC is no longer required for always-on monitoring

---

## Validation 1 — Omada Controller LXC Installation

### Expected Result

The Omada Controller should install successfully inside an LXC container on Proxmox.

### Result

Passed ✅

![Omada LXC package installation](../../screenshots/phase-6/01-omada-lxc-package-install.jpeg)

---

## Validation 2 — Proxmox Storage Layout

### Expected Result

Proxmox should have storage available for active workloads and backup/storage use.

### Result

Passed ✅

![Proxmox storage layout before HDD](../../screenshots/phase-6/02-proxmox-storage-layout-before-hdd.jpeg)

---

## Validation 3 — Proxmox Host Online

### Expected Result

The Proxmox host should be reachable through the web interface and show healthy node status.

### Result

Passed ✅

![Proxmox node summary](../../screenshots/phase-6/03-proxmox-node-summary.jpeg)

---

## Validation 4 — Omada Controller Dashboard Accessible

### Expected Result

The Omada Controller should be reachable from the LAN.

### Result

Passed ✅

![Omada Controller dashboard](../../screenshots/phase-6/04-omada-controller-dashboard.jpeg)

---

## Validation 5 — ER605 Address Reservations Configured

### Expected Result

The ER605 router should have DHCP reservations for core infrastructure devices.

### Result

Passed ✅

![ER605 address reservations](../../screenshots/phase-6/05-er605-address-reservations.jpeg)

> Note: MAC addresses should be blurred before publishing publicly.

---

## Validation 6 — ER605 LAN, DHCP, and Pi-hole DNS Configured

### Expected Result

The ER605 router should be preconfigured with the existing LAN IP plan before the physical router cutover.

### Expected Configuration

| Setting | Value |
|---|---|
| LAN IP | `192.168.68.1` |
| Subnet Mask | `255.255.255.0` |
| DHCP Range | `192.168.68.100-192.168.68.200` |
| Primary DNS | `192.168.68.20` |

### Result

Passed ✅

![ER605 LAN DHCP Pi-hole DNS](../../screenshots/phase-6/06-er605-lan-dhcp-pihole-dns.jpeg)

---

## Validation 7 — Docker VM Running on Proxmox

### Expected Result

The Ubuntu Docker VM should run on Proxmox and host the migrated monitoring stack.

### Result

Passed ✅

![Docker VM summary](../../screenshots/phase-6/07-docker-vm-summary.png)

---

## Validation 8 — Monitoring Stack Running on Docker VM

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

## Validation 9 — Grafana Accessible from Docker VM

### Expected Result

Grafana should be reachable from the LAN using the Docker VM IP address.

### URL

```text
http://192.168.68.81:3000
```

### Result

Passed ✅

![Grafana running from Docker VM](../../screenshots/phase-6/09-grafana-running-from-docker-vm.png)

---

## Validation 10 — Proxmox Backup to hdd-storage

### Expected Result

The Proxmox VM/LXC workloads should be backed up to the dedicated HDD storage target.

### Result

Passed ✅

![Proxmox backup to hdd-storage](../../screenshots/phase-6/10-proxmox-backup-to-hdd-storage.png)

---

## Validation 11 — Gaming PC Docker Stack Stopped

### Expected Result

The old Docker Desktop monitoring stack on the gaming PC should no longer be required.

### Result

Passed ✅

![Gaming PC Docker stopped](../../screenshots/phase-6/11-gaming-pc-docker-stopped.png)

---

## Conclusion

Phase 6 validation confirmed that the lab now has a dedicated Proxmox infrastructure layer.

The final state includes:

- Proxmox host online at `192.168.68.80`
- Omada Controller running in an LXC
- ER605 router preconfigured for the next cutover
- Docker monitoring stack running on an Ubuntu VM
- Grafana accessible from `192.168.68.81:3000`
- backups stored on `hdd-storage`
- gaming PC no longer required for always-on monitoring

This phase prepares the environment for the next step: moving the ER605 into the live routing path, switching Deco into AP mode, and later adding a managed switch for VLAN segmentation.
