# Phase 6.5 — RustDesk Remote Access & VM Hardening

## Overview

Phase 6.5 closes out the pre-cutover hardening work before moving into the managed router and switch cutover.

This phase includes two related workstreams:

- Self-hosted RustDesk remote access on a dedicated Debian VM
- Docker monitoring VM hardening and maintenance before the final network cutover

The goal was to make sure remote access, monitoring, backups, and VM operations were stable before changing the physical network path.

## Scope

### RustDesk Remote Access

- Created a lightweight Debian VM for RustDesk
- Assigned the VM a static IP: `192.168.68.83`
- Configured SSH key-based access
- Hardened SSH by disabling root login and password authentication
- Installed Docker and Docker Compose
- Deployed RustDesk Server OSS with `hbbs` and `hbbr`
- Configured UFW LAN-only firewall rules
- Configured RustDesk clients to use the self-hosted server
- Validated remote access between laptop, gaming PC, and phone
- Created a Proxmox backup for the RustDesk VM

### Docker Monitoring VM Hardening

- Renamed Proxmox VM `docker-services` to `docker-monitoring`
- Renamed the Ubuntu hostname to `docker-monitoring`
- Confirmed the monitoring stack still worked after rename
- Configured Docker log rotation
- Set Prometheus retention to `30d` / `10GB`
- Installed Portainer Agent on the monitoring VM
- Resized the monitoring VM disk to `50GB`
- Expanded the Ubuntu filesystem inside the VM
- Validated Docker containers after resize
- Created a final Proxmox backup after maintenance

## Final VM Layout

| VM / CT | Name | IP Address | Role |
|---:|---|---:|---|
| CT 180 | `omada-controller` | `192.168.68.10` | Omada Controller |
| VM 183 | `rustdesk-server` | `192.168.68.83` | Self-hosted RustDesk server |
| VM 281 | `docker-monitoring` | `192.168.68.81` | Monitoring stack and Portainer Agent |

Future app hosting will be handled on a separate VM:

| Future VM | Name | Planned IP | Role |
|---|---|---:|---|
| Future | `docker-apps` | `192.168.68.82` | Self-hosted apps and Portainer Server |

## Final Services

| Service | Host | Access |
|---|---|---|
| Grafana | `docker-monitoring` | `http://192.168.68.81:3000` |
| Prometheus | `docker-monitoring` | Internal Docker service |
| Alertmanager | `docker-monitoring` | Internal Docker service |
| Blackbox Exporter | `docker-monitoring` | Internal Docker service |
| Portainer Agent | `docker-monitoring` | `192.168.68.81:9001` |
| RustDesk Server | `rustdesk-server` | `192.168.68.83` |
| Omada Controller | `omada-controller` | `https://192.168.68.10:8043` |

## Security Notes

- RustDesk is LAN-only.
- Portainer Agent is LAN-only.
- No RustDesk or Portainer ports are publicly forwarded.
- SSH password authentication is disabled on the RustDesk VM.
- SSH root login is disabled on the RustDesk VM.
- Docker log rotation is configured to reduce disk growth.
- Prometheus retention is limited to `30d` / `10GB`.
- Proxmox backups were created after validation.

## Screenshot Evidence

### RustDesk VM Summary

![RustDesk Debian VM summary](../../screenshots/phase-6.5/01-rustdesk-debian-vm-summary.png)

### RustDesk Network Configuration

![RustDesk Debian network configuration](../../screenshots/phase-6.5/02-rustdesk-debian-network-config.png)

### RustDesk SSH Hardening

![SSH hardening configuration](../../screenshots/phase-6.5/03-ssh-hardening-config.png)

### RustDesk SSH Key Login

![SSH key login validation](../../screenshots/phase-6.5/04-ssh-key-login-validation.png)

### RustDesk Docker Compose

![RustDesk Docker Compose running](../../screenshots/phase-6.5/05-rustdesk-docker-compose-running.png)

### RustDesk UFW LAN-Only Firewall

![RustDesk UFW LAN-only firewall rules](../../screenshots/phase-6.5/06-rustdesk-ufw-status-lan-only.png)

### RustDesk Client Network Settings

![RustDesk client network settings](../../screenshots/phase-6.5/07-rustdesk-client-network-settings.png)

### RustDesk Client Connection Test

![RustDesk client connection test](../../screenshots/phase-6.5/08-rustdesk-client-connection-test.png)

### RustDesk Proxmox Backup

![RustDesk Proxmox backup](../../screenshots/phase-6.5/09-rustdesk-proxmox-backup.png)

### Docker Monitoring VM Rename

![Proxmox VM renamed docker-monitoring](../../screenshots/phase-6.5/01-proxmox-vm-renamed-docker-monitoring.png)

![Ubuntu hostname renamed docker-monitoring](../../screenshots/phase-6.5/02-ubuntu-hostname-renamed-docker-monitoring.png)

### Docker Monitoring Maintenance

![Monitoring stack before maintenance](../../screenshots/phase-6.5/03-monitoring-stack-before-maintenance.png)

![Docker log rotation config](../../screenshots/phase-6.5/04-docker-log-rotation-config.png)

![Prometheus retention config](../../screenshots/phase-6.5/05-prometheus-retention-config.png)

![Portainer Agent running](../../screenshots/phase-6.5/01-monitoring-vm-portainer-agent-running.png)

![Proxmox disk resized to 50GB](../../screenshots/phase-6.5/08-proxmox-disk-resized-to-50gb.png)

![Ubuntu disk expanded inside VM](../../screenshots/phase-6.5/09-ubuntu-disk-expanded-inside-vm.png)

![Final Docker validation after resize](../../screenshots/phase-6.5/10-final-docker-validation-after-resize.png)

![Final backup after monitoring maintenance](../../screenshots/phase-6.5/11-final-backup-after-monitoring-maintenance.png)

## Documentation

- [Overview](./overview.md)
- [Step-by-Step](./step-by-step.md)
- [Validation](./validation.md)
- [Diagrams](./diagrams.md)

## Result

Phase 6.5 confirmed that remote access, monitoring, Docker operations, VM naming, disk capacity, retention settings, and backups are ready before the managed router and switch cutover.

This marks the final pre-cutover hardening step before closing out Project 1 and moving future segmentation work into a separate project.
