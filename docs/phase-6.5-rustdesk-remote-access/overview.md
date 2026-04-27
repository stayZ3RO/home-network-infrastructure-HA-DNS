# Phase 6.5 Overview — RustDesk Remote Access Hardening

## Purpose

Phase 6.5 adds a self-hosted RustDesk remote access layer to the home infrastructure lab.

The purpose of this phase was to deploy RustDesk in a controlled and secure way before relying on it for remote access. The initial design keeps the RustDesk server LAN-only and avoids public exposure.

## Why Debian Was Used

Debian was selected because the RustDesk server has a narrow purpose and does not need a full desktop operating system.

Debian provides:

- Lightweight resource usage
- Stable package management
- Low overhead for a small VM
- A good base for Docker workloads
- Simpler backup and recovery

## VM Design

| Setting | Value |
|---|---|
| VM Name | `rustdesk-server` |
| VM ID | `183` |
| OS | Debian |
| CPU | `1 vCPU` |
| RAM | `1 GB` |
| Disk | `12 GB` |
| IP Address | `192.168.68.83` |
| Gateway | `192.168.68.1` |
| DNS | `192.168.68.20` |

## RustDesk Server Components

| Component | Container | Purpose |
|---|---|---|
| `hbbs` | `rustdesk-hbbs` | ID / rendezvous server |
| `hbbr` | `rustdesk-hbbr` | Relay server |

Docker Compose is used to keep the deployment reproducible.

## Security Model

Phase 6.5 uses a security-first approach.

Implemented controls:

- SSH key-based login
- Root SSH login disabled
- SSH password login disabled
- UFW enabled
- Default deny incoming policy
- RustDesk ports limited to `192.168.68.0/24`
- No public ER605 port forwarding yet

## Firewall Rules

Allowed only from the LAN:

| Port | Protocol | Purpose |
|---:|---|---|
| `22` | TCP | SSH |
| `21115` | TCP | RustDesk NAT test |
| `21116` | TCP | RustDesk ID / rendezvous |
| `21116` | UDP | RustDesk ID / rendezvous |
| `21117` | TCP | RustDesk relay |

## Client Validation

RustDesk client access was confirmed between:

- Laptop
- Gaming PC
- Phone

The client screenshots were sanitized by blurring RustDesk IDs and personal device details.

## Final State

Proxmox Host - `192.168.68.80`

- Debian RustDesk VM - `192.168.68.83`
  - Docker Engine
  - `rustdesk-hbbs`
  - `rustdesk-hbbr`
  - UFW LAN-only firewall
  - RustDesk client validation completed

## Screenshot Evidence

![RustDesk Debian VM summary](../../screenshots/phase-6.5/01-rustdesk-debian-vm-summary.png)

![RustDesk Docker Compose running](../../screenshots/phase-6.5/05-rustdesk-docker-compose-running.png)

![RustDesk UFW LAN-only firewall rules](../../screenshots/phase-6.5/06-rustdesk-ufw-status-lan-only.png)

![RustDesk client connection test](../../screenshots/phase-6.5/08-rustdesk-client-connection-test.png)

![RustDesk Proxmox backup](../../screenshots/phase-6.5/09-rustdesk-proxmox-backup.png)
