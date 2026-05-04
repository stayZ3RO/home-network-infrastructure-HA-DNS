# Phase 6.5 - RustDesk Remote Access and VM Hardening 🛡️

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![Remote Access](https://img.shields.io/badge/remote_access-RustDesk-purple)
![Platform](https://img.shields.io/badge/platform-Proxmox-lightgrey)
![Security](https://img.shields.io/badge/security-LAN%20only-success)
![Docker](https://img.shields.io/badge/runtime-Docker-blue)

## Phase Summary

Phase 6.5 added self-hosted RustDesk remote access and VM hardening to the home infrastructure lab.

This phase deployed RustDesk server components in a dedicated VM while keeping the service LAN-only for this project.

---

## What This Phase Demonstrates

| Area | Demonstrated Skill |
|---|---|
| Self-hosting | RustDesk server deployment |
| Remote access | hbbs and hbbr relay/broker services |
| Virtualization | Dedicated Proxmox VM |
| Docker services | Containerized RustDesk deployment |
| VM hardening | Baseline security and access control |
| Scope control | LAN-only service exposure |
| Documentation | Validation, diagrams, and closeout notes |

---

## Service Layout

    Proxmox Host
      ↓
    RustDesk Server VM - 192.168.68.83
      ├── rustdesk-hbbs
      └── rustdesk-hbbr

    Trusted LAN Clients
      ↓
    Self-hosted RustDesk Server

---

## Phase Documentation

| Page | Description |
|---|---|
| [Overview](overview.md) | Phase 6.5 case-study overview |
| [Step-by-Step Guide](step-by-step.md) | Implementation flow |
| [Validation](validation.md) | Validation evidence |
| [Diagrams](diagrams.md) | RustDesk service architecture |

---

## Design Decision

RustDesk was kept LAN-only in this project.

This avoided unnecessary public exposure while still providing useful self-hosted remote access experience inside the trusted home network.

---

## Outcome

At the end of this phase, the lab included a self-hosted remote access service with a documented VM baseline and clear exposure boundary.
