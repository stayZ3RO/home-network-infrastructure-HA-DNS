# Phase 5.5 Overview: Tailscale Subnet Router 🔐

![status](https://img.shields.io/badge/status-complete-brightgreen)
![scope](https://img.shields.io/badge/scope-remote_access-blue)
![platform](https://img.shields.io/badge/platform-Debian-lightgrey)
![access](https://img.shields.io/badge/access-Tailscale-purple)

## Purpose

Phase 5.5 adds a dedicated Tailscale subnet router VM to provide remote access to internal lab services by their normal LAN IP addresses.

The goal was to improve the original Phase 5 remote access design by centralizing remote LAN routing through a lightweight Debian VM instead of installing Tailscale directly on every service.

## Why This Was Added

The lab already had secure remote access through Tailscale. However, accessing internal services by LAN IP required a cleaner routing design.

The subnet router solves this by advertising the home LAN subnet into Tailscale:

~~~text
192.168.68.0/24
~~~

Trusted Tailscale clients can now reach internal services such as Pi-hole, Proxmox, Grafana, Omada, and RustDesk without exposing those services publicly.

## VM Role

| VM | IP Address | Role |
|---|---:|---|
| `tailscale-router` | `192.168.68.84` | Advertises `192.168.68.0/24` into Tailscale |

## Scope

Included:

- Dedicated Debian VM
- DHCP reservation using Proxmox virtual NIC MAC
- Tailscale installation
- IPv4 forwarding
- LAN subnet advertisement
- Tailscale route approval
- UFW routing rules
- Remote LAN access validation
- Proxmox backup

Not included:

- VLAN routing
- Exit node configuration
- Public port forwarding
- Docker
- Application hosting

## Final Remote Access Targets

| Service | Address |
|---|---|
| Pi-hole VIP | `http://192.168.68.20/admin` |
| Proxmox | `https://192.168.68.80:8006` |
| Grafana | `http://192.168.68.81:3000` |
| Omada Controller | `https://192.168.68.10` |
| RustDesk Server | `192.168.68.83` |

## Outcome

Remote trusted devices can access core lab services through Tailscale using normal LAN IP addresses with no public port forwarding.
