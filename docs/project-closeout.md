# Project Closeout — HA DNS & Core Infrastructure Foundation

## Summary

This repository is complete as the first major home infrastructure project.

It documents a resilient foundation for DNS, monitoring, alerting, secure remote access, virtualization, and service hosting.

---

## Completed Capabilities

- Network baseline and ISP migration documentation
- Pi-hole DNS filtering and query visibility
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
- Docker log rotation
- Prometheus retention controls
- Portainer Agent preparation
- Proxmox backup validation

---

## Final Project 1 State

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

The HA DNS and infrastructure foundation are complete.

The next logical step is a managed routing, switching, and VLAN segmentation project. That work changes the network architecture enough that it should be documented in a dedicated repository.

---

## Moved to Separate Project

The next project will cover:

- ER605 live router cutover
- managed switch as the core switch
- Deco AP mode migration
- VLAN segmentation
- inter-VLAN firewall policy
- trusted, lab, IoT, and guest isolation
- optional Omada EAP SSID-to-VLAN mapping

---

## Final Result

This project demonstrates practical infrastructure work across networking, Linux, DNS, monitoring, alerting, virtualization, secure access, documentation, and operational validation.
