# Phase 6.5 Overview — RustDesk Remote Access & VM Hardening

## Purpose

Phase 6.5 prepares the lab for project closeout and the future network cutover by validating remote access, VM hardening, Docker monitoring maintenance, and backup readiness.

This phase is intentionally scoped as a pre-cutover hardening phase.

## Why This Phase Matters

Before changing the physical network path, the lab needed reliable access and recovery options.

This phase confirmed:

- RustDesk remote access works across trusted devices.
- SSH access is hardened.
- Docker monitoring has controlled log and metrics retention.
- The monitoring VM has enough disk capacity.
- Portainer Agent is ready for future centralized Docker management.
- Final Proxmox backups exist.

## Final Architecture

| Component | Host | IP |
|---|---|---:|
| Proxmox Host | `pve` | `192.168.68.80` |
| Omada Controller | CT 180 | `192.168.68.10` |
| Docker Monitoring | VM 281 | `192.168.68.81` |
| RustDesk Server | VM 183 | `192.168.68.83` |

## RustDesk Server

RustDesk runs on a Debian VM.

| Item | Value |
|---|---|
| VM Name | `rustdesk-server` |
| VM ID | `183` |
| IP Address | `192.168.68.83` |
| OS | Debian |
| Runtime | Docker Compose |
| Containers | `rustdesk-hbbs`, `rustdesk-hbbr` |
| Firewall | UFW LAN-only |

## Docker Monitoring VM

The Docker monitoring VM was renamed and hardened.

| Item | Value |
|---|---|
| Old VM Name | `docker-services` |
| New VM Name | `docker-monitoring` |
| VM ID | `281` |
| IP Address | `192.168.68.81` |
| Disk | `50GB` |
| Docker logs | `10MB x 3 files` |
| Prometheus retention | `30d` / `10GB` |
| Portainer component | Agent only |

## Portainer Design

Portainer is being split cleanly:

| Host | Component |
|---|---|
| `docker-monitoring` | Portainer Agent |
| Future `docker-apps` VM | Portainer Server |

This keeps the monitoring VM focused on observability and allows the future app-hosting VM to provide the Portainer UI.

## Security Approach

- RustDesk remains LAN-only.
- Portainer Agent remains LAN-only.
- No public forwarding is configured for RustDesk or Portainer.
- SSH hardening is documented.
- Backups exist before moving to the next project.

## Result

The lab has validated remote access, monitoring, hardening, and backup readiness.

This phase supports closing out the HA DNS / core infrastructure foundation project.
