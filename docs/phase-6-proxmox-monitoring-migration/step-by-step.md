# Phase 6 — Step-by-Step Guide 🛠️

## 📖 Purpose

This guide documents the process of creating a Proxmox-based virtualization environment and migrating the monitoring stack from the gaming PC to an Ubuntu VM.

The migration moved the stack from:

```text
Gaming PC / Docker Desktop
```

to:

```text
Proxmox Host / Ubuntu VM / Docker Engine
```

---

## ✅ Prerequisites

Before starting Phase 6, the following were already complete:

- HA DNS with dual Pi-hole nodes
- Prometheus, Grafana, Alertmanager, and Blackbox Exporter running from the gaming PC
- Node Exporter installed on both Pi nodes
- Blackbox DNS probes configured
- Alertmanager Discord notifications working
- Tailscale remote access configured
- Proxmox host hardware available

---

## 1. Deploy the Proxmox Host 🖥️

The first step was preparing the dedicated virtualization host.

### Tasks completed

1. installed Proxmox VE on the host hardware
2. connected the host to the home network
3. accessed the Proxmox web UI
4. confirmed node health and resource visibility
5. prepared the host for VM deployment

### Validation

- Proxmox web UI was reachable
- host node appeared healthy
- storage and resource information were visible

![Proxmox host dashboard](../../screenshots/phase-6/01-proxmox-host-dashboard.png)

![Proxmox node summary](../../screenshots/phase-6/02-proxmox-node-summary.png)

---

## 2. Create the Ubuntu Monitoring VM 🐧

An Ubuntu VM was created to host the migrated monitoring stack.

### Tasks completed

1. uploaded or attached the Ubuntu ISO
2. created a new VM in Proxmox
3. assigned CPU, memory, and disk resources
4. installed Ubuntu
5. created an admin user
6. confirmed shell access

### Validation

- Ubuntu VM was created successfully
- VM booted normally
- console login worked
- VM had network connectivity

![Ubuntu monitoring VM created](../../screenshots/phase-6/03-ubuntu-monitoring-vm-created.png)

![Ubuntu VM hardware resources](../../screenshots/phase-6/04-ubuntu-vm-hardware-resources.png)

![Ubuntu VM console login](../../screenshots/phase-6/05-ubuntu-vm-console-login.png)

---

## 3. Install Docker on the Ubuntu VM 🐳

Docker was installed directly inside the Ubuntu VM.

### Tasks completed

1. updated the package index
2. installed Docker Engine
3. installed Docker Compose support
4. added the user to the Docker group if needed
5. confirmed Docker commands worked

### Example validation commands

```bash
docker --version
docker compose version
docker ps
```

### Validation

- Docker was installed successfully
- Docker Compose was available
- Docker commands worked inside the Ubuntu VM

![Docker installed on Ubuntu VM](../../screenshots/phase-6/06-docker-installed-on-ubuntu-vm.png)

---

## 4. Recreate the Monitoring Directory 📂

A monitoring directory was created on the Ubuntu VM.

### Tasks completed

1. created a Docker workspace
2. created the monitoring folder
3. recreated the expected folder structure
4. prepared folders for Prometheus, Grafana, Alertmanager, and Blackbox Exporter

### Example structure

```text
/home/ash/docker/monitoring/
├── docker-compose.yml
├── prometheus/
├── alertmanager/
├── blackbox/
└── grafana/
```

### Validation

- monitoring folder existed on the Ubuntu VM
- expected service folders were present

![Monitoring directory created on VM](../../screenshots/phase-6/07-monitoring-directory-created-on-vm.png)

---

## 5. Copy the Monitoring Stack from the Gaming PC 📦

The existing monitoring configuration was copied from the gaming PC / Docker Desktop environment to the Ubuntu VM.

### Migrated configuration

- `docker-compose.yml`
- Prometheus configuration
- Prometheus alert rules
- Alertmanager configuration
- Blackbox Exporter configuration
- Grafana provisioning files
- dashboard exports or dashboard JSON files

### Important security note

The Discord webhook secret was not committed to Git.

The webhook secret was recreated locally on the Ubuntu VM.

```text
alertmanager/secrets/discord_webhook_url
```

### Validation

- monitoring files existed on the Ubuntu VM
- service folders matched the expected structure
- secrets were handled locally and kept out of Git

![Monitoring files copied to VM](../../screenshots/phase-6/08-monitoring-files-copied-to-vm.png)

---

## 6. Recreate Alertmanager Secret Handling 🔐

Alertmanager needed access to the Discord webhook secret on the new VM.

### Tasks completed

1. created the local secrets folder
2. recreated the Discord webhook secret file
3. mounted the secrets folder into Alertmanager as read-only
4. confirmed the secret was excluded from Git

### Host path

```text
alertmanager/secrets/discord_webhook_url
```

### Container path

```text
/etc/alertmanager/secrets/discord_webhook_url
```

### Docker Compose mount

```yaml
- ./alertmanager/secrets:/etc/alertmanager/secrets:ro
```

### Validation

- secret file existed on the Ubuntu VM
- secret file existed inside the Alertmanager container
- webhook URL was not committed to Git

---

## 7. Start the Monitoring Stack on the Ubuntu VM 🚀

The stack was started with Docker Compose.

### Command used

```bash
docker compose up -d
```

### Validation commands

```bash
docker ps
docker compose ps
```

### Expected containers

- Grafana
- Prometheus
- Alertmanager
- Blackbox Exporter

### Validation

- all monitoring containers started successfully
- containers remained running
- required ports were available on the VM

![Docker Compose up on Ubuntu VM](../../screenshots/phase-6/09-docker-compose-up-on-ubuntu-vm.png)

![Monitoring containers running on VM](../../screenshots/phase-6/10-monitoring-containers-running-on-vm.png)

---

## 8. Validate Grafana Access 📊

Grafana was accessed using the Ubuntu VM IP address.

### Example

```text
http://<monitoring-vm-ip>:3000
```

### Validation

- Grafana login page loaded
- dashboards were available
- Prometheus data source worked
- dashboards showed current metrics

![Grafana accessible from VM IP](../../screenshots/phase-6/11-grafana-accessible-from-vm-ip.png)

---

## 9. Validate Prometheus Targets 📡

Prometheus target health was checked after the migration.

### Validation performed

- confirmed Prometheus was scraping expected jobs
- confirmed Node Exporter targets were up
- confirmed Alertmanager was reachable
- confirmed Blackbox Exporter was reachable

### Validation queries

```promql
up
```

### Result

- Prometheus targets were healthy after the migration

![Prometheus targets up after migration](../../screenshots/phase-6/12-prometheus-targets-up-after-migration.png)

---

## 10. Validate Blackbox DNS Probes 🌐

Blackbox DNS probes were validated after migration.

### Validation query

```promql
probe_success
```

### Expected targets

- HA DNS VIP
- `ashpi-1` direct DNS
- `ashpi-2` direct DNS

### Result

- VIP DNS probe remained healthy
- node DNS probes remained healthy
- monitoring still confirmed DNS availability

![Blackbox probes healthy after migration](../../screenshots/phase-6/13-blackbox-probes-healthy-after-migration.png)

---

## 11. Validate Alertmanager and Discord Alerts 🔔

Alertmanager was validated after migration.

### Tasks completed

1. confirmed Alertmanager container was running
2. confirmed the secret file existed inside the container
3. sent a manual test alert to Alertmanager
4. confirmed Discord received the alert

### Result

- Alertmanager routing worked after migration
- Discord notifications continued working from the new VM

![Alertmanager running after migration](../../screenshots/phase-6/14-alertmanager-running-after-migration.png)

![Discord alert test after migration](../../screenshots/phase-6/17-discord-alert-test-after-migration.png)

---

## 12. Validate Grafana Dashboards After Migration ✅

Both Grafana dashboards were checked after moving the stack.

### Dashboards validated

- Node Health
- DNS & Failover

### Result

- Node Health dashboard showed live data
- DNS & Failover dashboard showed live DNS probe status
- dashboards continued working from the Ubuntu VM

![Node Health dashboard after migration](../../screenshots/phase-6/15-node-health-dashboard-after-migration.png)

![DNS Failover dashboard after migration](../../screenshots/phase-6/16-dns-failover-dashboard-after-migration.png)

---

## 13. Stop the Old Gaming PC Docker Stack 🛑

After confirming the new VM-based monitoring stack worked, the old Docker Desktop stack on the gaming PC was no longer required.

### Tasks completed

1. stopped the old Docker Desktop monitoring containers
2. confirmed Grafana still worked from the Ubuntu VM
3. confirmed Prometheus and probes stayed healthy
4. confirmed the gaming PC was no longer required for monitoring uptime

### Validation

- old stack stopped
- new VM stack continued working
- monitoring dependency moved away from the gaming PC

![Gaming PC Docker stack stopped](../../screenshots/phase-6/18-gaming-pc-docker-stack-stopped.png)

---

## 14. Confirm Final Monitoring State 🏁

The final state was validated from the Proxmox-hosted Ubuntu VM.

### Final result

- Proxmox host online
- Ubuntu monitoring VM online
- Docker monitoring stack running
- Grafana accessible
- Prometheus targets healthy
- Blackbox DNS probes healthy
- Alertmanager running
- Discord alerts working
- gaming PC no longer required for monitoring

![Final monitoring state on Proxmox VM](../../screenshots/phase-6/19-final-monitoring-state-on-proxmox-vm.png)

---

## 🏁 Result

Phase 6 successfully migrated the monitoring stack from the gaming PC to a Proxmox-hosted Ubuntu VM.

This improved the lab by adding:

- a dedicated virtualization layer
- better separation of personal workstation and infrastructure services
- a more reliable monitoring host
- continued Grafana dashboard visibility
- continued Prometheus metrics collection
- continued Alertmanager and Discord alerting
- a stronger platform for future infrastructure services
