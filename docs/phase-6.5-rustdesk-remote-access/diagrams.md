# Phase 6.5 Diagrams — RustDesk Remote Access Hardening

## Purpose

This document shows the RustDesk remote access architecture used in Phase 6.5.

## Phase 6.5 RustDesk Architecture

Trusted LAN - `192.168.68.0/24`

- Laptop
- Gaming PC
- Phone

These clients connect to:

Proxmox Host - `192.168.68.80`

- Debian RustDesk VM - `192.168.68.83`
  - Docker
  - `rustdesk-hbbs`
  - `rustdesk-hbbr`
  - UFW LAN-only firewall

## Service Roles

| Service | Role |
|---|---|
| `rustdesk-hbbs` | ID / rendezvous server |
| `rustdesk-hbbr` | Relay server |

## Security Boundary

Allowed:

- `192.168.68.0/24` to RustDesk VM

Blocked:

- Internet to RustDesk VM
- Unknown external clients to RustDesk VM

No public ER605 port forwarding was configured during this phase.

## Firewall Scope

| Port | Protocol | Source |
|---:|---|---|
| `22` | TCP | `192.168.68.0/24` |
| `21115` | TCP | `192.168.68.0/24` |
| `21116` | TCP | `192.168.68.0/24` |
| `21116` | UDP | `192.168.68.0/24` |
| `21117` | TCP | `192.168.68.0/24` |

## Future Remote Access Option

If public RustDesk access is needed later, it should be documented separately after the ER605 cutover.

Future public exposure would require:

- ER605 firewall and NAT review
- Explicit port forwarding rules
- Risk review
- Backup validation
- Additional monitoring
- Documentation update

For Phase 6.5, RustDesk remains LAN-only.
