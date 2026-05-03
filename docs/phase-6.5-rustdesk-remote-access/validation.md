# Phase 6.5 Validation — RustDesk Remote Access & VM Hardening

## Validation Summary

| Check | Result |
|---|---|
| RustDesk VM running | Passed |
| RustDesk static IP configured | Passed |
| SSH hardening configured | Passed |
| SSH key login validated | Passed |
| RustDesk containers running | Passed |
| UFW LAN-only firewall configured | Passed |
| RustDesk client settings configured | Passed |
| RustDesk remote access tested | Passed |
| RustDesk VM backed up | Passed |
| Docker VM renamed to `docker-monitoring` | Passed |
| Ubuntu hostname renamed | Passed |
| Monitoring stack validated | Passed |
| Docker log rotation configured | Passed |
| Prometheus retention configured | Passed |
| Portainer Agent running | Passed |
| Monitoring VM disk resized | Passed |
| Ubuntu filesystem expanded | Passed |
| Final Docker validation completed | Passed |
| Final Proxmox backup completed | Passed |

## RustDesk Validation

![RustDesk Debian VM summary](../../screenshots/phase-6.5/01-rustdesk-debian-vm-summary.png)

![RustDesk Debian network configuration](../../screenshots/phase-6.5/02-rustdesk-debian-network-config.png)

![SSH hardening configuration](../../screenshots/phase-6.5/03-ssh-hardening-config.png)

![SSH key login validation](../../screenshots/phase-6.5/04-ssh-key-login-validation.png)

![RustDesk Docker Compose running](../../screenshots/phase-6.5/05-rustdesk-docker-compose-running.png)

![RustDesk UFW LAN-only firewall rules](../../screenshots/phase-6.5/06-rustdesk-ufw-status-lan-only.png)

![RustDesk client network settings](../../screenshots/phase-6.5/07-rustdesk-client-network-settings.png)

![RustDesk client connection test](../../screenshots/phase-6.5/08-rustdesk-client-connection-test.png)

![RustDesk Proxmox backup](../../screenshots/phase-6.5/09-rustdesk-proxmox-backup.png)

## Docker Monitoring Maintenance Validation

![Proxmox VM renamed docker-monitoring](../../screenshots/phase-6.5/01-proxmox-vm-renamed-docker-monitoring.png)

![Ubuntu hostname renamed docker-monitoring](../../screenshots/phase-6.5/02-ubuntu-hostname-renamed-docker-monitoring.png)

![Monitoring stack before maintenance](../../screenshots/phase-6.5/03-monitoring-stack-before-maintenance.png)

![Docker log rotation config](../../screenshots/phase-6.5/04-docker-log-rotation-config.png)

![Prometheus retention config](../../screenshots/phase-6.5/05-prometheus-retention-config.png)

![Portainer Agent running](../../screenshots/phase-6.5/01-monitoring-vm-portainer-agent-running.png)

![Proxmox disk resized to 50GB](../../screenshots/phase-6.5/08-proxmox-disk-resized-to-50gb.png)

![Ubuntu disk expanded inside VM](../../screenshots/phase-6.5/09-ubuntu-disk-expanded-inside-vm.png)

![Final Docker validation after resize](../../screenshots/phase-6.5/10-final-docker-validation-after-resize.png)

![Final backup after monitoring maintenance](../../screenshots/phase-6.5/11-final-backup-after-monitoring-maintenance.png)

## Conclusion

Phase 6.5 passed validation.

The lab now has working LAN-only RustDesk remote access, a hardened monitoring VM, controlled Docker and Prometheus retention, a Portainer Agent ready for future centralized management, expanded disk capacity, and final backup evidence.
