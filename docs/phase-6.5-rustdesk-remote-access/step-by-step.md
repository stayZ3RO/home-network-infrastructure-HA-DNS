# Phase 6.5 Step-by-Step — RustDesk Remote Access Hardening

## Overview

This guide documents the steps used to deploy and secure a self-hosted RustDesk server on a Debian VM running inside Proxmox.

## Step 1 — Create the Debian VM

A lightweight Debian VM was created in Proxmox.

| Setting | Value |
|---|---|
| VM Name | `rustdesk-server` |
| VM ID | `183` |
| OS | Debian |
| CPU | `1 vCPU` |
| RAM | `1 GB` |
| Disk | `12 GB` |
| IP Address | `192.168.68.83` |

![RustDesk Debian VM summary](../../screenshots/phase-6.5/01-rustdesk-debian-vm-summary.png)

## Step 2 — Configure Static IP

The Debian VM was configured with a static IP.

| Setting | Value |
|---|---|
| IP Address | `192.168.68.83` |
| Gateway | `192.168.68.1` |
| DNS | `192.168.68.20` |

Validation commands used:

- `ip a`
- `ip route`
- `ping -c 4 192.168.68.1`
- `ping -c 4 192.168.68.20`

![RustDesk Debian network configuration](../../screenshots/phase-6.5/02-rustdesk-debian-network-config.png)

## Step 3 — Configure SSH Key Access

An existing Ed25519 SSH key was reused and copied to the RustDesk VM.

Command used:

- `ssh-copy-id -i ~/.ssh/id_ed25519.pub ash@192.168.68.83`

SSH key login was then tested:

- `ssh ash@192.168.68.83`

![SSH key login validation](../../screenshots/phase-6.5/04-ssh-key-login-validation.png)

## Step 4 — Harden SSH

SSH was hardened by disabling root login and password authentication.

File updated:

- `/etc/ssh/sshd_config`

Expected values:

| Setting | Value |
|---|---|
| `PermitRootLogin` | `no` |
| `PasswordAuthentication` | `no` |
| `PubkeyAuthentication` | `yes` |

SSH was restarted after changes.

![SSH hardening configuration](../../screenshots/phase-6.5/03-ssh-hardening-config.png)

## Step 5 — Install Docker

Docker was installed on the Debian VM.

Commands used:

- `apt update`
- `apt install -y curl ca-certificates gnupg git sudo ufw`
- `curl -fsSL https://get.docker.com | sh`
- `usermod -aG docker ash`

Docker was validated with:

- `docker --version`
- `docker compose version`
- `docker run hello-world`

## Step 6 — Create RustDesk Docker Compose Stack

A RustDesk project folder was created under:

- `/root/rustdesk`

The Docker Compose stack includes:

| Container | Purpose |
|---|---|
| `rustdesk-hbbs` | ID / rendezvous server |
| `rustdesk-hbbr` | Relay server |

The stack was started with:

- `docker compose up -d`
- `docker compose ps`

![RustDesk Docker Compose running](../../screenshots/phase-6.5/05-rustdesk-docker-compose-running.png)

## Step 7 — Configure LAN-Only Firewall

UFW was configured to deny incoming traffic by default and allow only the LAN subnet.

Allowed rules:

| Port | Protocol | Source |
|---:|---|---|
| `22` | TCP | `192.168.68.0/24` |
| `21115` | TCP | `192.168.68.0/24` |
| `21116` | TCP | `192.168.68.0/24` |
| `21116` | UDP | `192.168.68.0/24` |
| `21117` | TCP | `192.168.68.0/24` |

![RustDesk UFW LAN-only firewall rules](../../screenshots/phase-6.5/06-rustdesk-ufw-status-lan-only.png)

## Step 8 — Configure RustDesk Clients

RustDesk clients were configured to use the self-hosted server.

| Setting | Value |
|---|---|
| ID Server | `192.168.68.83` |
| Relay Server | `192.168.68.83` |
| Key | RustDesk server key from `rustdesk-hbbs` logs |

The actual key value was blurred in screenshots before publishing.

![RustDesk client network settings](../../screenshots/phase-6.5/07-rustdesk-client-network-settings.png)

## Step 9 — Validate Remote Access

Remote access was tested between:

- Laptop
- Gaming PC
- Phone

The test confirmed that clients could connect using the self-hosted RustDesk server.

![RustDesk client connection test](../../screenshots/phase-6.5/08-rustdesk-client-connection-test.png)

## Step 10 — Back Up the RustDesk VM

A Proxmox backup was created for the RustDesk VM and stored on `hdd-storage`.

Recommended backup settings:

| Setting | Value |
|---|---|
| Storage | `hdd-storage` |
| Mode | `Stop` |
| Compression | `ZSTD` |

![RustDesk Proxmox backup](../../screenshots/phase-6.5/09-rustdesk-proxmox-backup.png)

## Final State

Debian RustDesk VM - `192.168.68.83`

- SSH hardened
- Docker installed
- `rustdesk-hbbs` running
- `rustdesk-hbbr` running
- UFW active
- LAN-only access enforced
- Remote access validated between trusted devices
- Proxmox backup completed
