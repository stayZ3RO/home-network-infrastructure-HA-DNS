# Phase 6 — Proxmox Infrastructure & Omada Network Foundation

## Overview

Phase 6 adds a dedicated infrastructure layer to the home network lab using a Dell OptiPlex running Proxmox.

This phase moves always-on services away from a gaming PC and onto a dedicated virtualization host. It also introduces the Omada Software Controller, prepares the ER605 router, and pre-stages the managed switch for the Phase 7 cutover.

---

## What This Phase Includes

- Installed and configured Proxmox on a Dell OptiPlex
- Assigned the Proxmox host a static IP: `192.168.68.80`
- Created an Omada Controller LXC
- Hosted the Omada Controller at `192.168.68.10`
- Preconfigured the ER605 router for the existing LAN
- Preserved the existing `192.168.68.0/24` network
- Configured DHCP to use the Pi-hole VIP as DNS
- Created an Ubuntu Docker VM for monitoring services
- Migrated the monitoring stack from Docker Desktop on the gaming PC to the Proxmox Docker VM
- Validated Grafana access from the new VM IP
- Confirmed the gaming PC is no longer required for always-on monitoring
- Added backup coverage using Proxmox and `hdd-storage`
- Pre-staged the managed switch in Omada
- Adopted the managed switch into the Omada Controller
- Validated client connectivity through the managed switch
- Documented the temporary switch staging IP and planned final management IP

---

## Why This Phase Matters

Before this phase, the monitoring stack depended on Docker Desktop running on a gaming PC. That worked for early testing, but it was not ideal for an always-on infrastructure lab.

Moving these services to Proxmox improves the environment by:

- Removing the gaming PC as an infrastructure dependency
- Creating a dedicated always-on services host
- Improving backup and recovery options
- Preparing for managed routing and VLAN segmentation
- Building a cleaner network management foundation

---

## Current IP Plan

| Device / Service | IP Address | Purpose |
|---|---:|---|
| Gateway / Future ER605 LAN | `192.168.68.1` | Default gateway |
| Managed Switch | `192.168.68.59` temporary / `192.168.68.2` planned | Switch pre-staging and future core switch |
| Omada Controller LXC | `192.168.68.10` | Omada software controller |
| Pi-hole VIP | `192.168.68.20` | HA DNS endpoint |
| ashPi-1 | `192.168.68.60` | Pi-hole / Unbound node 1 |
| ashPi-2 | `192.168.68.61` | Pi-hole / Unbound node 2 |
| Proxmox Host | `192.168.68.80` | Virtualization host |
| Docker Monitoring VM | `192.168.68.81` | Monitoring stack |
| RustDesk VM | `192.168.68.83` | Planned remote access service |
| DHCP Range | `192.168.68.100-200` | Client devices |

---

## Current Architecture

```text
OptiPlex / Proxmox Host - 192.168.68.80
├── Omada Controller LXC - 192.168.68.10
│   └── Omada Software Controller
│
└── Ubuntu Docker VM - 192.168.68.81
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter

Managed Switch
├── Temporary staging IP: 192.168.68.59
└── Planned final management IP: 192.168.68.2
```

---

## Router Preconfiguration

The ER605 was preconfigured to match the existing home network before the physical cutover.

| Setting | Value |
|---|---|
| LAN IP | `192.168.68.1` |
| Subnet Mask | `255.255.255.0` |
| DHCP Start | `192.168.68.100` |
| DHCP End | `192.168.68.200` |
| Primary DNS | `192.168.68.20` |

This preserves the existing Pi-hole HA DNS design and avoids changing the current LAN subnet during the router migration.

---

## Managed Switch Pre-Staging

The managed switch was adopted into Omada before the live router/switch cutover.

During Phase 6, the switch used a temporary DHCP address of:

```text
192.168.68.59
```

The planned final management IP is:

```text
192.168.68.2
```

The final IP will be assigned after the ER605 becomes the active router/DHCP server during Phase 7.

![Switch adopted in Omada](../../screenshots/phase-6/switch-prep/02-switch-adopted-in-omada.png)

![Client test through managed switch](../../screenshots/phase-6/switch-prep/05-client-test-through-managed-switch.png)

---

## Key Result

The monitoring stack now runs from an Ubuntu VM hosted on Proxmox instead of Docker Desktop on the gaming PC.

The Omada Controller is also running from a Proxmox LXC, the ER605 router is staged for the next cutover, and the managed switch has been adopted into Omada.

![Proxmox node summary](../../screenshots/phase-6/03-proxmox-node-summary.jpeg)

![Omada Controller dashboard](../../screenshots/phase-6/04-omada-controller-dashboard.jpeg)

![Docker Compose monitoring stack running](../../screenshots/phase-6/08-docker-compose-monitoring-running.png)

![Grafana running from Docker VM](../../screenshots/phase-6/09-grafana-running-from-docker-vm.png)

---

## Documentation

- [Overview](./overview.md)
- [Step-by-Step Guide](./step-by-step.md)
- [Validation](./validation.md)
- [Diagrams](./diagrams.md)
- [Managed Switch Pre-Staging](./managed-switch-prep.md)

---

## Next Phase

The next phase will move the ER605 into the live network path.

Planned next steps:

- Harden RustDesk remote access in Phase 6.5
- Plug the ER605 into the active network path
- Move routing and DHCP from Deco to ER605
- Make the managed switch the core switch
- Switch Deco mesh into AP mode
- Validate client DHCP, DNS, and internet access
- Confirm Pi-hole HA DNS still works through the VIP
- Build VLAN segmentation later in Phase 8
