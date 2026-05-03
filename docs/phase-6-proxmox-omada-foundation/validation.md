# Phase 6 Validation — Proxmox, Omada & Docker Monitoring Foundation ✅

## Validation Summary

| Validation Item | Expected Result | Status |
|---|---|---|
| Proxmox host online | Host reachable at `192.168.68.80` | Passed |
| Omada Controller online | Controller reachable at `192.168.68.10:8043` | Passed |
| ER605 preconfigured | LAN/DHCP/DNS staged before cutover | Passed |
| Docker monitoring VM running | VM online at `192.168.68.81` | Passed |
| Monitoring stack migrated | Grafana/Prometheus stack runs from VM | Passed |
| Grafana reachable | UI reachable from Docker VM IP | Passed |
| Gaming PC no longer required | Old Docker stack stopped | Passed |
| Proxmox backup complete | Backup stored on `hdd-storage` | Passed |
| Managed switch adopted | Switch visible and adopted in Omada | Passed |
| Client through switch validated | Client reached core services through switch | Passed |

---

## 1. Proxmox Host Validation

![Proxmox node summary](../../screenshots/phase-6/03-proxmox-node-summary.jpeg)

Result: Proxmox host is online and hosting lab services.

---

## 2. Omada Controller Validation

![Omada Controller dashboard](../../screenshots/phase-6/04-omada-controller-dashboard.jpeg)

Result: Omada Controller is running from the Proxmox LXC.

---

## 3. ER605 Preconfiguration Validation

![ER605 address reservations](../../screenshots/phase-6/05-er605-address-reservations.jpeg)

![ER605 LAN DHCP Pi-hole DNS](../../screenshots/phase-6/06-er605-lan-dhcp-pihole-dns.jpeg)

Result: ER605 was staged with the existing LAN plan and Pi-hole VIP DNS target.

---

## 4. Docker Monitoring VM Validation

![Docker VM summary](../../screenshots/phase-6/07-docker-vm-summary.png)

![Docker Compose monitoring stack running](../../screenshots/phase-6/08-docker-compose-monitoring-running.png)

Result: Monitoring stack runs on the dedicated Docker VM.

---

## 5. Grafana Validation

![Grafana running from Docker VM](../../screenshots/phase-6/09-grafana-running-from-docker-vm.png)

Result: Grafana is reachable from the Docker VM IP.

---

## 6. Backup Validation

![Proxmox backup to hdd-storage](../../screenshots/phase-6/10-proxmox-backup-to-hdd-storage.png)

Result: Proxmox backup target is working.

---

## 7. Gaming PC Dependency Removed

![Gaming PC Docker stopped](../../screenshots/phase-6/11-gaming-pc-docker-stopped.png)

Result: Monitoring no longer depends on the gaming PC.

---

## 8. Managed Switch Pre-Staging

![Switch adopted in Omada](../../screenshots/phase-6/switch-prep/02-switch-adopted-in-omada.png)

![Client test through managed switch](../../screenshots/phase-6/switch-prep/05-client-test-through-managed-switch.png)

Result: Managed switch was adopted and tested before future cutover work.

---

## Conclusion

Phase 6 passed validation.

The lab now has a dedicated Proxmox infrastructure foundation, Omada Controller, Docker monitoring VM, staged ER605 config, managed switch pre-staging, and backup coverage.
