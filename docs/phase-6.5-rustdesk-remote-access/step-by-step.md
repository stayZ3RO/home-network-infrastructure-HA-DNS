# Phase 6.5 Step-by-Step — RustDesk Remote Access & VM Hardening

## Step 1 — Validate RustDesk Debian VM

The RustDesk server was deployed as a Debian VM.

| Setting | Value |
|---|---|
| VM Name | `rustdesk-server` |
| VM ID | `183` |
| IP Address | `192.168.68.83` |

Evidence:

![RustDesk Debian VM summary](../../screenshots/phase-6.5/01-rustdesk-debian-vm-summary.png)

## Step 2 — Validate RustDesk Network

The RustDesk VM was configured with static network settings and validated against the gateway and Pi-hole DNS.

Evidence:

![RustDesk Debian network configuration](../../screenshots/phase-6.5/02-rustdesk-debian-network-config.png)

## Step 3 — Harden RustDesk SSH

SSH was configured for key-based access.

Expected SSH hardening values:

| Setting | Value |
|---|---|
| `PermitRootLogin` | `no` |
| `PasswordAuthentication` | `no` |
| `PubkeyAuthentication` | `yes` |

Evidence:

![SSH hardening configuration](../../screenshots/phase-6.5/03-ssh-hardening-config.png)

![SSH key login validation](../../screenshots/phase-6.5/04-ssh-key-login-validation.png)

## Step 4 — Validate RustDesk Docker Compose

RustDesk Server OSS was deployed using Docker Compose.

Expected containers:

- `rustdesk-hbbs`
- `rustdesk-hbbr`

Evidence:

![RustDesk Docker Compose running](../../screenshots/phase-6.5/05-rustdesk-docker-compose-running.png)

## Step 5 — Validate RustDesk UFW LAN-Only Firewall

UFW was configured to allow RustDesk only from the LAN.

Allowed source:

- `192.168.68.0/24`

Evidence:

![RustDesk UFW LAN-only firewall rules](../../screenshots/phase-6.5/06-rustdesk-ufw-status-lan-only.png)

## Step 6 — Validate RustDesk Clients

RustDesk clients were configured to use the self-hosted server.

Expected client settings:

| Setting | Value |
|---|---|
| ID Server | `192.168.68.83` |
| Relay Server | `192.168.68.83` |
| Key | RustDesk server key |

Evidence:

![RustDesk client network settings](../../screenshots/phase-6.5/07-rustdesk-client-network-settings.png)

![RustDesk client connection test](../../screenshots/phase-6.5/08-rustdesk-client-connection-test.png)

## Step 7 — Back Up RustDesk VM

A Proxmox backup was created for the RustDesk VM.

Evidence:

![RustDesk Proxmox backup](../../screenshots/phase-6.5/09-rustdesk-proxmox-backup.png)

## Step 8 — Rename Docker Monitoring VM

The Proxmox VM was renamed from `docker-services` to `docker-monitoring`.

Evidence:

![Proxmox VM renamed docker-monitoring](../../screenshots/phase-6.5/01-proxmox-vm-renamed-docker-monitoring.png)

The Ubuntu hostname was also renamed.

Evidence:

![Ubuntu hostname renamed docker-monitoring](../../screenshots/phase-6.5/02-ubuntu-hostname-renamed-docker-monitoring.png)

## Step 9 — Validate Monitoring Stack Before Maintenance

The monitoring stack was confirmed before applying maintenance changes.

Expected containers:

- Grafana
- Prometheus
- Alertmanager
- Blackbox Exporter

Evidence:

![Monitoring stack before maintenance](../../screenshots/phase-6.5/03-monitoring-stack-before-maintenance.png)

## Step 10 — Configure Docker Log Rotation

Docker log rotation was configured to prevent container logs from growing indefinitely.

Configured values:

| Setting | Value |
|---|---|
| Log driver | `json-file` |
| Max size | `10m` |
| Max files | `3` |

Evidence:

![Docker log rotation config](../../screenshots/phase-6.5/04-docker-log-rotation-config.png)

## Step 11 — Configure Prometheus Retention

Prometheus retention was limited.

Configured values:

| Setting | Value |
|---|---|
| Retention time | `30d` |
| Retention size | `10GB` |

Evidence:

![Prometheus retention config](../../screenshots/phase-6.5/05-prometheus-retention-config.png)

## Step 12 — Install Portainer Agent

Portainer Agent was installed on the monitoring VM.

Expected port:

| Port | Purpose |
|---:|---|
| `9001` | Portainer Agent endpoint |

Evidence:

![Portainer Agent running](../../screenshots/phase-6.5/01-monitoring-vm-portainer-agent-running.png)

## Step 13 — Resize Monitoring VM Disk

The monitoring VM disk was resized to `50GB`.

Evidence:

![Proxmox disk resized to 50GB](../../screenshots/phase-6.5/08-proxmox-disk-resized-to-50gb.png)

The Ubuntu filesystem was expanded inside the VM.

Evidence:

![Ubuntu disk expanded inside VM](../../screenshots/phase-6.5/09-ubuntu-disk-expanded-inside-vm.png)

## Step 14 — Final Docker Validation

Docker was validated after the rename, retention changes, agent install, and disk resize.

Evidence:

![Final Docker validation after resize](../../screenshots/phase-6.5/10-final-docker-validation-after-resize.png)

## Step 15 — Final Backup

A final Proxmox backup was completed after monitoring maintenance.

Evidence:

![Final backup after monitoring maintenance](../../screenshots/phase-6.5/11-final-backup-after-monitoring-maintenance.png)

## Final State

Phase 6.5 completed the final hardening and validation work before project closeout.
