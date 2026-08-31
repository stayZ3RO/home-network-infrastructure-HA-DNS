# Phase 5.5: Tailscale Subnet Router & Remote LAN Access 🔐

![status](https://img.shields.io/badge/status-complete-brightgreen)
![scope](https://img.shields.io/badge/scope-remote_access-blue)
![platform](https://img.shields.io/badge/platform-Debian-lightgrey)
![access](https://img.shields.io/badge/access-Tailscale-purple)

## Phase Summary

Phase 5.5 extends the original Tailscale remote access design by adding a dedicated subnet router VM.

Instead of installing Tailscale directly on every internal service, a lightweight Debian VM advertises the home LAN subnet into Tailscale. This allows trusted remote devices to access internal services by their normal LAN IP addresses while avoiding public port forwarding.

## What This Phase Demonstrates

| Area | Implementation |
|---|---|
| Remote access | Tailscale subnet routing |
| Routing | `192.168.68.0/24` advertised into the tailnet |
| Security | No public port forwarding |
| VM design | Lightweight Debian utility VM |
| Firewalling | UFW rules for SSH and routed traffic |
| Validation | Remote access to Pi-hole, Proxmox, Grafana, Omada, and RustDesk |
| Documentation | Screenshots, validation checks, and Project 2 notes |

## Final Design

| Device / Service | IP Address | Purpose |
|---|---:|---|
| `tailscale-router` | `192.168.68.84` | Advertises LAN subnet into Tailscale |
| Pi-hole VIP | `192.168.68.20` | HA DNS entry point |
| Proxmox | `192.168.68.80` | Virtualization host |
| `docker-monitoring` | `192.168.68.81` | Grafana / Prometheus stack |
| RustDesk VM | `192.168.68.83` | Self-hosted remote access server |
| Omada Controller | `192.168.68.10` | Network controller |

## Architecture

~~~text
Trusted Remote Device
MacBook / Phone / Laptop
        |
        v
     Tailscale
        |
        v
tailscale-router VM
192.168.68.84
        |
        v
Home LAN
192.168.68.0/24
        |
        +--> Pi-hole VIP      192.168.68.20
        +--> Proxmox          192.168.68.80
        +--> Grafana          192.168.68.81:3000
        +--> Omada Controller 192.168.68.10
        +--> RustDesk VM      192.168.68.83
~~~

## Key Design Decisions

- The subnet router is isolated on its own Debian VM.
- The VM remains lightweight and purpose-specific.
- Debian uses DHCP with a reserved LAN address.
- The gateway reservation UI is not included in this Project 1 documentation because that belongs to the later managed-router cutover state.
- Project 1 documents the Proxmox virtual NIC MAC source and Debian DHCP lease validation instead.
- Only the flat LAN subnet `192.168.68.0/24` is advertised.
- VLAN-aware remote access will be handled later in Project 2.

## Documentation

| File | Purpose |
|---|---|
| [overview.md](overview.md) | Design goals and architecture |
| [step-by-step.md](step-by-step.md) | Build and configuration process |
| [validation.md](validation.md) | Local and remote validation checks |
| [screenshots-checklist.md](screenshots-checklist.md) | Screenshot evidence list |
| [project-2-notes.md](project-2-notes.md) | Future VLAN-aware access notes |

## Screenshot Evidence

Screenshots for this phase are stored in:

~~~text
screenshots/phase-5.5-tailscale-subnet-router/
~~~

Key validation screenshots include:

| Screenshot | Purpose |
|---|---|
| `03-debian-dhcp-lease-validation.png` | Confirms reserved DHCP address |
| `06-ip-forwarding-enabled.png` | Confirms Linux routing is enabled |
| `07-tailscale-route-advertised-cli.png` | Confirms subnet advertisement |
| `08-tailscale-admin-route-approved.png` | Confirms Tailscale route approval |
| `09-ufw-status-tailscale-router.png` | Confirms firewall posture |
| `12-remote-pihole-vip-over-tailscale.png` | Confirms remote Pi-hole access |
| `13-remote-proxmox-ui-over-lan-ip.png` | Confirms remote Proxmox access |
| `14-remote-grafana-ui-over-lan-ip.png` | Confirms remote Grafana access |

## Outcome

Trusted Tailscale devices can now access core lab services remotely using normal LAN IP addresses without exposing SSH, Proxmox, Grafana, Omada, RustDesk, or Pi-hole directly to the internet.

This keeps Project 1 aligned with the original security goal: private infrastructure access without public port forwarding.
