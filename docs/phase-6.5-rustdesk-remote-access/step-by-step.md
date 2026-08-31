# Phase 6.5 Step-by-Step: RustDesk Remote Access & VM Hardening 🔐

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


## Step 1: Validate RustDesk Debian VM

![RustDesk Debian VM summary](../../screenshots/phase-6.5/01-rustdesk-debian-vm-summary.png)

## Step 2: Validate RustDesk Network

![RustDesk Debian network configuration](../../screenshots/phase-6.5/02-rustdesk-debian-network-config.png)

## Step 3: Validate SSH Hardening

![SSH hardening configuration](../../screenshots/phase-6.5/03-ssh-hardening-config.png)

![SSH key login validation](../../screenshots/phase-6.5/04-ssh-key-login-validation.png)

## Step 4: Validate RustDesk Containers

![RustDesk Docker Compose running](../../screenshots/phase-6.5/05-rustdesk-docker-compose-running.png)

## Step 5: Validate UFW LAN-Only Rules

![RustDesk UFW LAN-only firewall rules](../../screenshots/phase-6.5/06-rustdesk-ufw-status-lan-only.png)

## Step 6: Validate RustDesk Clients

![RustDesk client network settings](../../screenshots/phase-6.5/07-rustdesk-client-network-settings.png)

![RustDesk client connection test](../../screenshots/phase-6.5/08-rustdesk-client-connection-test.png)

## Step 7: Validate RustDesk Backup

![RustDesk Proxmox backup](../../screenshots/phase-6.5/09-rustdesk-proxmox-backup.png)

## Step 8: Rename Docker Monitoring VM

![Proxmox VM renamed docker-monitoring](../../screenshots/phase-6.5/01-proxmox-vm-renamed-docker-monitoring.png)

![Ubuntu hostname renamed docker-monitoring](../../screenshots/phase-6.5/02-ubuntu-hostname-renamed-docker-monitoring.png)

## Step 9: Validate Monitoring Before Maintenance

![Monitoring stack before maintenance](../../screenshots/phase-6.5/03-monitoring-stack-before-maintenance.png)

## Step 10: Configure Docker Log Rotation

![Docker log rotation config](../../screenshots/phase-6.5/04-docker-log-rotation-config.png)

## Step 11: Configure Prometheus Retention

![Prometheus retention config](../../screenshots/phase-6.5/05-prometheus-retention-config.png)

## Step 12: Install Portainer Agent

![Portainer Agent running](../../screenshots/phase-6.5/01-monitoring-vm-portainer-agent-running.png)

## Step 13: Resize Monitoring VM Disk

![Proxmox disk resized to 50GB](../../screenshots/phase-6.5/08-proxmox-disk-resized-to-50gb.png)

![Ubuntu disk expanded inside VM](../../screenshots/phase-6.5/09-ubuntu-disk-expanded-inside-vm.png)

## Step 14: Final Docker Validation

![Final Docker validation after resize](../../screenshots/phase-6.5/10-final-docker-validation-after-resize.png)

## Step 15: Final Backup

![Final backup after monitoring maintenance](../../screenshots/phase-6.5/11-final-backup-after-monitoring-maintenance.png)

## Result

Phase 6.5 completed the final remote access and VM hardening work before closing Project 1.
