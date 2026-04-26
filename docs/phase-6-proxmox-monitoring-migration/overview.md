# Phase 6 — Proxmox Host Environment & Monitoring Stack Migration 🖥️

## 📖 Overview

Phase 6 introduces a dedicated virtualization layer into the home infrastructure lab.

Before this phase, the monitoring stack was running on the gaming PC through Docker Desktop. That worked for the first version of Phase 4, but it created an operational dependency on a personal workstation.

If the gaming PC was shut down, rebooted, or used heavily for gaming, the monitoring stack could go offline.

To improve reliability, the monitoring stack was migrated to an Ubuntu VM running on a Proxmox host.

---

## 🎯 Objectives

The objectives of this phase were to:

- deploy a Proxmox host environment
- create an Ubuntu VM for Docker-based infrastructure services
- migrate the monitoring stack from Docker Desktop to Docker Engine
- keep Grafana, Prometheus, Alertmanager, and Blackbox Exporter running independently from the gaming PC
- validate that dashboards, probes, alerts, and Discord notifications continued working after migration
- establish a cleaner foundation for future self-hosted services

---

## 🧱 Before Migration

The monitoring stack originally ran on the gaming PC.

```text
Gaming PC
  ↓
Docker Desktop
  ↓
Grafana
Prometheus
Alertmanager
Blackbox Exporter
```

This worked, but it had limitations:

- the gaming PC had to stay powered on
- Docker Desktop depended on the Windows workstation
- gaming or rebooting the PC could interrupt monitoring
- the setup was less production-like
- infrastructure services were mixed with a personal workstation

---

## 🧱 After Migration

The monitoring stack now runs from an Ubuntu VM on Proxmox.

```text
Proxmox Host
  ↓
Ubuntu Monitoring VM
  ↓
Docker Engine
  ↓
Docker Compose
  ↓
Grafana
Prometheus
Alertmanager
Blackbox Exporter
```

This provides a cleaner separation between personal workstation use and always-on infrastructure services.

---

## 🖥️ Proxmox Host Role

The Proxmox host provides the virtualization layer for the lab.

Its role is to:

- host infrastructure VMs
- support future service expansion
- separate workloads from the gaming PC
- provide a better foundation for production-style service hosting
- allow future test/dev and production-style environments

![Proxmox host dashboard](../../screenshots/phase-6/01-proxmox-host-dashboard.png)

![Proxmox node summary](../../screenshots/phase-6/02-proxmox-node-summary.png)

---

## 🐧 Ubuntu Monitoring VM Role

The Ubuntu VM became the new home for the Docker monitoring stack.

It runs:

- Docker Engine
- Docker Compose
- Grafana
- Prometheus
- Alertmanager
- Blackbox Exporter

![Ubuntu monitoring VM created](../../screenshots/phase-6/03-ubuntu-monitoring-vm-created.png)

![Ubuntu VM hardware resources](../../screenshots/phase-6/04-ubuntu-vm-hardware-resources.png)

---

## 📊 Monitoring Services Preserved

The migration preserved the core Phase 4 monitoring services:

- Grafana dashboards
- Prometheus scrape jobs
- Prometheus alert rules
- Blackbox DNS probes
- Alertmanager notification routing
- Discord alert delivery

---

## 🔐 Security Approach

Security decisions for this phase included:

- keeping monitoring services LAN-only
- avoiding internet-facing port forwarding
- keeping the Discord webhook out of Git
- storing Alertmanager webhook secrets locally
- mounting secrets into the container as read-only
- validating access through internal network paths only

---

## ✅ Validation Summary

The migration was successful after confirming:

- the Ubuntu VM was running under Proxmox
- Docker was installed and working inside the VM
- the monitoring stack started successfully with Docker Compose
- Grafana was reachable from the VM IP
- Prometheus targets were healthy
- Blackbox DNS probes were healthy
- Alertmanager was running
- Discord alert delivery still worked
- the gaming PC Docker stack could be stopped without losing monitoring

![Monitoring containers running on VM](../../screenshots/phase-6/10-monitoring-containers-running-on-vm.png)

![Prometheus targets up after migration](../../screenshots/phase-6/12-prometheus-targets-up-after-migration.png)

![Blackbox probes healthy after migration](../../screenshots/phase-6/13-blackbox-probes-healthy-after-migration.png)

---

## 🏁 Outcome

Phase 6 moved the monitoring stack from a workstation-dependent setup into a dedicated virtualized infrastructure environment.

At the end of this phase, the lab had:

- a Proxmox host environment
- an Ubuntu VM for monitoring services
- Docker Compose running on Linux instead of Docker Desktop
- monitoring independent from the gaming PC
- Grafana dashboards restored
- Prometheus and Blackbox monitoring restored
- Alertmanager and Discord notifications restored
- a stronger foundation for future infrastructure services

---

## 🚀 Next Step

The next infrastructure improvements can focus on:

- managed switching
- VLAN segmentation
- separating production, lab, guest, and IoT networks
- hosting additional services on Proxmox
- separating production and test/dev workloads
- improving backup and restore workflows
