# Project Closeout — HA DNS & Core Infrastructure Foundation ✅

## Summary

This repository is complete as the first major home infrastructure project.

The project built a resilient foundation for home network services, including HA DNS, recursive DNS, observability, alerting, secure remote access, Proxmox-based service hosting, and backup validation.

---

## Completed Capabilities

- Network baseline and ISP migration documentation
- Centralized DNS filtering with Pi-hole
- Dual-node HA DNS with Keepalived VIP failover
- Gravity Sync replication between Pi-hole nodes
- Local recursive DNS with Unbound
- Prometheus and Grafana monitoring
- Alertmanager alert routing
- Discord alert delivery
- Tailscale secure remote administration
- Proxmox infrastructure host
- Omada Controller LXC
- Docker monitoring VM
- Monitoring migration from gaming PC to Linux VM
- RustDesk self-hosted remote access
- Docker log rotation and Prometheus retention controls
- Portainer Agent preparation
- Proxmox backup validation

---

## Final Infrastructure State

```text
AT&T Fiber / ONT
  ↓
AT&T Gateway with IP Passthrough
  ↓
Deco Mesh Router
  ↓
Home LAN - 192.168.68.0/24
  ├── HA DNS VIP - 192.168.68.20
  ├── ashpi-1 - 192.168.68.60
  ├── ashpi-2 - 192.168.68.61
  ├── Proxmox Host - 192.168.68.80
  ├── Docker Monitoring VM - 192.168.68.81
  ├── RustDesk Server VM - 192.168.68.83
  └── Omada Controller LXC - 192.168.68.10
```

---

## Why The Project Ends Here

The foundation layer is complete.

The next logical step is a managed routing, switching, and VLAN segmentation project. That work changes the network architecture enough that it should be documented as a separate project rather than appended onto this repository.

This keeps this repository focused on:

- HA DNS
- observability
- alerting
- secure access
- service hosting
- validation and documentation

---

## Moved to Separate Project

The next project will cover:

- ER605 live router cutover
- Managed switch as the core switch
- Deco AP mode migration
- VLAN segmentation
- Inter-VLAN firewall policy
- Trusted, lab, IoT, and guest isolation
- Optional Omada EAP SSID-to-VLAN mapping

Suggested next project:

```text
Home Network Segmentation Lab — ER605, Managed Switching & VLAN Isolation
```

---

## Final Result

This project demonstrates a complete, documented infrastructure foundation with practical networking, Linux, DNS, monitoring, alerting, virtualization, remote access, and operational validation experience.
