# Phase 6.5 — Validation

## Purpose

This document validates the RustDesk remote access hardening phase.

The goal was to prove that RustDesk was running from a dedicated Debian VM, protected by LAN-only firewall rules, and usable between trusted devices.

## Validation 1 — Debian VM Running in Proxmox

### Expected Result

The RustDesk VM should be running in Proxmox with lightweight resource allocation.

### Result

Passed ✅

![RustDesk Debian VM summary](../../screenshots/phase-6.5/01-rustdesk-debian-vm-summary.png)

## Validation 2 — Static Network Configuration

### Expected Result

The RustDesk VM should use static IP `192.168.68.83` and reach the gateway and DNS.

### Result

Passed ✅

![RustDesk Debian network configuration](../../screenshots/phase-6.5/02-rustdesk-debian-network-config.png)

## Validation 3 — SSH Hardening

### Expected Result

SSH should be hardened with root login disabled, password authentication disabled, and public key authentication enabled.

Expected values:

| Setting | Value |
|---|---|
| `PermitRootLogin` | `no` |
| `PasswordAuthentication` | `no` |
| `PubkeyAuthentication` | `yes` |

### Result

Passed ✅

![SSH hardening configuration](../../screenshots/phase-6.5/03-ssh-hardening-config.png)

## Validation 4 — SSH Key Login

### Expected Result

The admin user should be able to SSH into the RustDesk VM using key-based authentication.

### Result

Passed ✅

![SSH key login validation](../../screenshots/phase-6.5/04-ssh-key-login-validation.png)

## Validation 5 — RustDesk Docker Containers Running

### Expected Result

The RustDesk `hbbs` and `hbbr` containers should be running.

Expected containers:

- `rustdesk-hbbs`
- `rustdesk-hbbr`

### Result

Passed ✅

![RustDesk Docker Compose running](../../screenshots/phase-6.5/05-rustdesk-docker-compose-running.png)

## Validation 6 — UFW LAN-Only Firewall

### Expected Result

UFW should be active with incoming traffic denied by default and RustDesk ports allowed only from `192.168.68.0/24`.

Expected allowed ports:

| Port | Protocol | Source |
|---:|---|---|
| `22` | TCP | `192.168.68.0/24` |
| `21115` | TCP | `192.168.68.0/24` |
| `21116` | TCP | `192.168.68.0/24` |
| `21116` | UDP | `192.168.68.0/24` |
| `21117` | TCP | `192.168.68.0/24` |

### Result

Passed ✅

![RustDesk UFW LAN-only firewall rules](../../screenshots/phase-6.5/06-rustdesk-ufw-status-lan-only.png)

## Validation 7 — RustDesk Client Network Settings

### Expected Result

RustDesk clients should point to the self-hosted RustDesk server.

Expected client settings:

| Setting | Value |
|---|---|
| ID Server | `192.168.68.83` |
| Relay Server | `192.168.68.83` |
| Key | RustDesk server key |

### Result

Passed ✅

![RustDesk client network settings](../../screenshots/phase-6.5/07-rustdesk-client-network-settings.png)

## Validation 8 — Remote Access Test

### Expected Result

RustDesk remote access should work between trusted devices using the self-hosted server.

Validated devices:

- Laptop
- Gaming PC
- Phone

### Result

Passed ✅

![RustDesk client connection test](../../screenshots/phase-6.5/08-rustdesk-client-connection-test.png)

## Validation 9 — Proxmox Backup

### Expected Result

The RustDesk VM should be backed up to `hdd-storage`.

### Result

Passed ✅

![RustDesk Proxmox backup](../../screenshots/phase-6.5/09-rustdesk-proxmox-backup.png)

## Conclusion

Phase 6.5 successfully deployed and validated self-hosted RustDesk remote access on a lightweight Debian VM.

The final state includes:

- Debian RustDesk VM online at `192.168.68.83`
- SSH hardening completed
- SSH key login validated
- RustDesk `hbbs` and `hbbr` running through Docker Compose
- UFW enabled with LAN-only firewall rules
- RustDesk clients configured for the self-hosted server
- Remote access confirmed between laptop, gaming PC, and phone
- Proxmox backup completed and documented
