# Phase 6 Overview — Proxmox Infrastructure & Omada Network Foundation

## Purpose

Phase 6 builds the dedicated infrastructure layer for the home network lab.

The goal was to move critical always-on services away from a gaming PC and onto a dedicated Proxmox host. This phase also introduced the Omada Software Controller and prepared the ER605 router for the upcoming network cutover.

## Phase Goals

- Deploy Proxmox on the Dell OptiPlex
- Use the OptiPlex as the dedicated infrastructure host
- Host the Omada Software Controller in an LXC container
- Preconfigure the ER605 router for the current LAN
- Preserve the existing HA DNS design
- Migrate monitoring services from the gaming PC to a Proxmox VM
- Reduce dependency on Docker Desktop running on a personal workstation
- Prepare the network for future managed switch and VLAN segmentation work

## Before Phase 6

Before this phase, the monitoring stack was running on the gaming PC through Docker Desktop and WSL.

```text
Gaming PC
└── Docker Desktop / WSL
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter
```

This worked for early lab testing, but it had several limitations:

- The gaming PC had to remain powered on for monitoring
- Docker Desktop became part of the infrastructure dependency chain
- Backups were less centralized
- Monitoring was tied to a non-dedicated endpoint
- The lab lacked a dedicated virtualization/service layer

## After Phase 6

After this phase, the monitoring stack runs on an Ubuntu Docker VM hosted by Proxmox.

```text
OptiPlex / Proxmox Host - 192.168.68.80
├── Omada Controller LXC - 192.168.68.62
│   └── Omada Software Controller
│
└── Ubuntu Docker VM - 192.168.68.81
    ├── Grafana
    ├── Prometheus
    ├── Alertmanager
    └── Blackbox Exporter
```

The gaming PC is no longer required for always-on monitoring.

## Current IP Plan

| Device / Service | IP Address | Purpose |
|---|---:|---|
| Gateway / Future ER605 LAN | `192.168.68.1` | Default gateway |
| Pi-hole VIP | `192.168.68.20` | HA DNS endpoint |
| ashPi-1 | `192.168.68.60` | Pi-hole / Unbound node 1 |
| ashPi-2 | `192.168.68.61` | Pi-hole / Unbound node 2 |
| Omada Controller LXC | `192.168.68.62` | Omada software controller |
| Proxmox Host | `192.168.68.80` | Virtualization host |
| Docker Monitoring VM | `192.168.68.81` | Monitoring stack |
| DHCP Range | `192.168.68.100-200` | Client devices |

## Proxmox Host Role

The Proxmox host now acts as the dedicated infrastructure node for the lab.

Current workloads:

| Workload | Type | IP Address |
|---|---|---:|
| Omada Controller | LXC | `192.168.68.62` |
| Docker Monitoring Stack | Ubuntu VM | `192.168.68.81` |

The Proxmox host itself is managed at:

```text
https://192.168.68.80:8006
```

## Storage Design

The Proxmox host uses SSD-backed storage for active workloads and HDD-backed storage for backup and support files.

```text
Proxmox Storage
├── local / local-lvm
│   ├── active VMs
│   ├── active LXCs
│   └── running workloads
│
└── hdd-storage
    ├── backups
    ├── ISO images
    ├── templates
    └── archives
```

This separates active service storage from backup/recovery storage.

## Omada Controller Role

The Omada Software Controller was deployed as an LXC container.

Purpose:

- Avoid buying an Omada hardware controller
- Manage the ER605 router
- Prepare for future managed switch adoption
- Centralize Omada configuration
- Support future VLAN and network segmentation work

The controller is reachable at:

```text
https://192.168.68.62:8043
```

## ER605 Router Preconfiguration

The ER605 was preconfigured before being placed into the live network path.

Configured values:

| Setting | Value |
|---|---|
| LAN IP | `192.168.68.1` |
| Subnet Mask | `255.255.255.0` |
| DHCP Range | `192.168.68.100-192.168.68.200` |
| Primary DNS | `192.168.68.20` |

This keeps the existing Pi-hole HA DNS setup intact.

The Pi-hole VIP remains the DNS target:

```text
192.168.68.20
```

## Monitoring Migration

The Docker monitoring stack was migrated from the gaming PC to the Ubuntu Docker VM.

Migrated services:

| Service | Purpose |
|---|---|
| Grafana | Dashboards and visualization |
| Prometheus | Metrics collection |
| Alertmanager | Alert routing |
| Blackbox Exporter | Endpoint and service probing |

Migrated Docker volumes:

```text
monitoring_grafana_data
monitoring_prometheus_data
monitoring_alertmanager_data
```

## Screenshot Evidence

### Proxmox Host

![Proxmox node summary](../../screenshots/phase-6/03-proxmox-node-summary.jpeg)

### Omada Controller

![Omada Controller dashboard](../../screenshots/phase-6/04-omada-controller-dashboard.jpeg)

### ER605 Router Preconfiguration

![ER605 LAN DHCP Pi-hole DNS](../../screenshots/phase-6/06-er605-lan-dhcp-pihole-dns.jpeg)

### Docker Monitoring VM

![Docker VM summary](../../screenshots/phase-6/07-docker-vm-summary.png)

### Monitoring Stack Running

![Docker Compose monitoring stack running](../../screenshots/phase-6/08-docker-compose-monitoring-running.png)

### Grafana Validation

![Grafana running from Docker VM](../../screenshots/phase-6/09-grafana-running-from-docker-vm.png)

## Final Result

Phase 6 successfully created a dedicated infrastructure layer for the lab.

Final state:

- Proxmox is running on the OptiPlex
- Omada Controller is running as an LXC
- Monitoring is running from an Ubuntu Docker VM
- Grafana is accessible from `192.168.68.81:3000`
- ER605 is preconfigured for the next cutover
- Pi-hole HA DNS design remains intact
- Gaming PC is no longer required for always-on monitoring

## Next Steps

The next phase will complete the physical router cutover.

Planned next steps:

- Insert the ER605 into the live network path
- Move DHCP/routing duties from Deco to ER605
- Switch Deco mesh into AP mode
- Validate client DHCP and DNS
- Confirm Pi-hole still receives client queries through the VIP
- Add managed switch when available
- Build VLAN segmentation in a later phase
