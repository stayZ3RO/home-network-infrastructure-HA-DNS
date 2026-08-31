# Documentation Hub 📚

This folder contains the phase-by-phase documentation for the completed Home Network Infrastructure Lab.

The project is organized as a build progression. Each phase adds one infrastructure capability, validates it, and documents the result.

---

## Project Scope

This repository covers the completed HA DNS and core infrastructure foundation:

- network baseline and ISP migration
- Pi-hole DNS control
- high availability DNS
- recursive DNS with Unbound
- monitoring and alerting
- secure remote access
- Proxmox-hosted core services
- RustDesk remote access and VM hardening

Managed routing cutover, managed switching production cutover, VLAN segmentation, and firewall policy are tracked in a separate network segmentation project.

---

## Phase Index

| Phase | Area | Documentation |
|---|---|---|
| Phase 1 | Network Control | [phase-1-network-control](phase-1-network-control/) |
| Phase 1.5 | ISP Migration | [phase-1.5-isp-migration](phase-1.5-isp-migration/) |
| Phase 2 | DNS Control | [phase-2-dns-control](phase-2-dns-control/) |
| Phase 3 | High Availability DNS | [phase-3-ha-dns](phase-3-ha-dns/) |
| Phase 4 | Monitoring & Alerting | [phase-4-monitoring-alerting](phase-4-monitoring-alerting/) |
| Phase 5 | Tailscale Remote Access | [phase-5-tailscale-remote-access](phase-5-tailscale-remote-access/) |
| Phase 5.5 | Remote LAN access through Tailscale subnet routing | [phase-5.5-tailscale-subnet-router](phase-5.5-tailscale-subnet-router/) |
| Phase 6 | Proxmox & Service Migration | [phase-6-proxmox-omada-foundation](phase-6-proxmox-omada-foundation/) |
| Phase 6.5 | RustDesk, VM hardening, Portainer, and Docker visibility | [phase-6.5-rustdesk-remote-access](phase-6.5-rustdesk-remote-access/) |

---

## Standard Phase Structure

Each phase is intended to include:

| File | Purpose |
|---|---|
| `README.md` | Phase landing page and quick navigation |
| `overview.md` | Design intent, architecture, and why the phase matters |
| `step-by-step.md` | Implementation flow and validation checkpoints |
| `validation.md` | Evidence that the phase worked |
| `diagrams.md` | Architecture diagrams or text diagrams where applicable |
| supporting docs | Phase-specific notes such as alerting, dashboards, or jump box access |

---

## Review Path

For a portfolio/recruiter review, start here:

1. [Phase 3, High Availability DNS](./phase-3-ha-dns)
2. [Phase 4, Monitoring & Alerting](./phase-4-monitoring-alerting)
3. [Phase 5, Tailscale Remote Access](./phase-5-tailscale-remote-access)
4. [Phase 6, Proxmox & Service Migration](./phase-6-proxmox-omada-foundation)
5. [Phase 6.5, RustDesk & VM Hardening](./phase-6.5-rustdesk-remote-access)

Those phases best demonstrate operational infrastructure work.
