# Phase 6 Step-by-Step: Proxmox, Omada & Docker Monitoring Foundation 🧱

## Step 1: Deploy Proxmox

Installed Proxmox on the Dell OptiPlex and assigned it the management IP:

- `192.168.68.80`

Validation:

![Proxmox node summary](../../screenshots/phase-6/03-proxmox-node-summary.jpeg)

---

## Step 2: Review Storage

Validated active VM/LXC storage and backup storage.

![Proxmox storage layout before HDD](../../screenshots/phase-6/02-proxmox-storage-layout-before-hdd.jpeg)

---

## Step 3: Deploy Omada Controller LXC

Created an LXC container for Omada Controller.

- Controller IP: `192.168.68.10`
- URL: `https://192.168.68.10:8043`

![Omada LXC package installation](../../screenshots/phase-6/01-omada-lxc-package-install.jpeg)

![Omada Controller dashboard](../../screenshots/phase-6/04-omada-controller-dashboard.jpeg)

---

## Step 4: Preconfigure ER605

Configured the ER605 for the existing LAN plan.

| Setting | Value |
|---|---|
| LAN IP | `192.168.68.1` |
| DHCP Range | `192.168.68.100-192.168.68.200` |
| Primary DNS | `192.168.68.20` |

![ER605 address reservations](../../screenshots/phase-6/05-er605-address-reservations.jpeg)

![ER605 LAN DHCP Pi-hole DNS](../../screenshots/phase-6/06-er605-lan-dhcp-pihole-dns.jpeg)

---

## Step 5: Create Docker Monitoring VM

Created the Docker VM for the monitoring stack.

- VM IP: `192.168.68.81`

![Docker VM summary](../../screenshots/phase-6/07-docker-vm-summary.png)

---

## Step 6: Migrate Monitoring Stack

Migrated Grafana, Prometheus, Alertmanager, and Blackbox Exporter from the gaming PC to the Docker VM.

![Docker Compose monitoring stack running](../../screenshots/phase-6/08-docker-compose-monitoring-running.png)

![Grafana running from Docker VM](../../screenshots/phase-6/09-grafana-running-from-docker-vm.png)

---

## Step 7: Stop Old Gaming PC Stack

Stopped the old Docker Desktop monitoring stack.

![Gaming PC Docker stopped](../../screenshots/phase-6/11-gaming-pc-docker-stopped.png)

---

## Step 8: Back Up Workloads

Created Proxmox backups to `hdd-storage`.

![Proxmox backup to hdd-storage](../../screenshots/phase-6/10-proxmox-backup-to-hdd-storage.png)

---

## Step 9: Pre-Stage Managed Switch

Adopted the managed switch into Omada while still on the existing flat LAN.

![Switch adopted in Omada](../../screenshots/phase-6/switch-prep/02-switch-adopted-in-omada.png)

![Client test through managed switch](../../screenshots/phase-6/switch-prep/05-client-test-through-managed-switch.png)

---

## Result

Phase 6 completed the infrastructure foundation and prepared the lab for Phase 6.5 hardening.
