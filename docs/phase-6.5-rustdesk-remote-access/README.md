# Phase 6.5 — RustDesk Remote Access & VM Hardening 🔐

![status](https://img.shields.io/badge/status-complete-brightgreen)
![remote access](https://img.shields.io/badge/remote%20access-RustDesk-0ea5e9)
![platform](https://img.shields.io/badge/platform-Proxmox-orange)
![security](https://img.shields.io/badge/security-LAN%20only-success)
![docker](https://img.shields.io/badge/runtime-Docker-blue)

---

## Phase Summary

Phase 6.5 added self-hosted RustDesk remote access and VM hardening to the lab.

RustDesk server components were deployed in a dedicated Debian VM and kept LAN-only for this project. The monitoring VM was also cleaned up with Docker log rotation, Prometheus retention limits, Portainer Agent, disk expansion, and final backup validation.


## Final Phase 6.5 Scope

Phase 6.5 originally focused on self-hosted RustDesk remote access and VM hardening.

During final Project 1 cleanup, this phase was expanded to include Docker visibility using a dedicated `docker-mgmt` VM running Portainer Server and a Portainer Agent on the existing `docker-monitoring` VM.

This keeps responsibilities separated:

| VM | Responsibility |
|---|---|
| `rustdesk-server` | RustDesk only |
| `docker-mgmt` | Portainer Server only |
| `docker-monitoring` | Monitoring stack + Portainer Agent |

---

## What This Phase Demonstrates

| Area | Demonstrated Skill |
|---|---|
| Self-hosting | RustDesk server deployment |
| Remote access | `hbbs` and `hbbr` services |
| Virtualization | Dedicated Proxmox VM |
| Docker services | Containerized RustDesk deployment |
| VM hardening | SSH and LAN-only firewall posture |
| Docker maintenance | Log rotation and retention controls |
| Backup readiness | Final Proxmox backup evidence |
| Scope control | Remote access validated without public exposure |

---

## Service Layout

```text
Proxmox Host
  ↓
RustDesk Server VM - 192.168.68.83
  ├── rustdesk-hbbs
  └── rustdesk-hbbr

Trusted LAN Clients
  ↓
Self-hosted RustDesk Server
```

![Phase 6.5 RustDesk on Proxmox diagram](../../diagrams/08-phase-6-5-rustdesk-proxmox.png)

---

## Phase Documentation

| Page | Description |
|---|---|
| [Overview](./overview.md) | Phase 6.5 case-study overview |
| [Step-by-Step Guide](./step-by-step.md) | Implementation flow |
| [Validation](./validation.md) | Validation evidence |
| [Diagrams](./diagrams.md) | RustDesk service architecture |
| [docker-management-portainer.md](docker-management-portainer.md) | Portainer Server, Agent, Docker visibility, and validation |
---

## Outcome

The lab included a self-hosted remote access service with a documented VM baseline, a LAN-only exposure boundary, and final pre-closeout maintenance evidence.
