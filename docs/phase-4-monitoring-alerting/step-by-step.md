# Phase 4 — Step-by-Step Guide 🛠️

---

## Quick Navigation

| Page | Link |
|---|---|
| Phase Home | [README](README.md) |
| Overview | [overview.md](overview.md) |
| Step-by-Step Guide | [step-by-step.md](step-by-step.md) |
| Dashboards | [dashboards.md](dashboards.md) |
| Alerting | [alerting.md](alerting.md) |
| Validation | [validation.md](validation.md) |
| Documentation Hub | [docs/](../README.md) |

---


## 📖 Purpose

This guide documents the implementation of the monitoring and alerting stack for the HA DNS environment.

Phase 4 builds on the completed HA DNS platform and adds:

- Prometheus
- Grafana
- Alertmanager
- Blackbox Exporter
- Node Exporter on both Raspberry Pi nodes
- Discord alert notifications

---

## ✅ Prerequisites

Before starting Phase 4, the following were already complete:

- HA DNS with dual Pi-hole nodes
- Gravity Sync
- keepalived VIP failover
- Unbound on both nodes
- successful failover validation from Phase 3
- Docker host / monitoring VM available
- Docker Compose available
- Discord webhook created for the `homelab-alerts` Discord server

---

## 1. Prepare the Monitoring Host 🖥️

The monitoring stack was deployed on a Docker host used for the lab monitoring services.

### Tasks completed

1. confirmed Docker was installed
2. confirmed Docker commands worked from the terminal
3. verified the monitoring host could reach the HA DNS network
4. confirmed the host could run the required containers

### Validation

- Docker was working
- containers could be started successfully
- monitoring services could run on the host

![Docker working inside Ubuntu WSL](../../screenshots/phase-4/00-docker-working-in-wsl.png)

---

## 2. Create the Monitoring Workspace 📂

A dedicated monitoring workspace was created.

### Tasks completed

1. created the monitoring directory
2. created subfolders for:
   - Prometheus
   - Alertmanager
   - Blackbox Exporter
   - Grafana provisioning
   - Grafana dashboards
3. created the initial monitoring configuration files

### Validation

- the directory structure existed
- the required files were created

![Monitoring folders created](../../screenshots/phase-4/02-monitoring-folders-created.png)

![Monitoring files created](../../screenshots/phase-4/03-monitoring-files-created.png)

---

## 3. Create the Docker Compose Stack 🐳

The monitoring stack was defined in `docker-compose.yml`.

### Services deployed

- Prometheus
- Alertmanager
- Blackbox Exporter
- Grafana

### Design choices

- Grafana was published to the host on port `3000`
- Prometheus remained available only inside the lab network path
- Alertmanager remained available only inside the lab network path
- Blackbox Exporter was not exposed publicly
- no monitoring services were port-forwarded to the internet

### Validation

- all containers started successfully with Docker Compose
- `docker ps` showed the services running

![Docker containers running](../../screenshots/phase-4/13-docker-containers-running.png)

---

## 4. Configure Prometheus 📡

Prometheus was configured to scrape both host metrics and DNS probe targets.

### Scrape targets added

- Prometheus
- Alertmanager
- Blackbox Exporter
- `ashpi-1` Node Exporter — `192.168.68.60:9100`
- `ashpi-2` Node Exporter — `192.168.68.61:9100`
- HA DNS VIP probe — `192.168.68.20:53`
- `ashpi-1` direct DNS probe — `192.168.68.60:53`
- `ashpi-2` direct DNS probe — `192.168.68.61:53`

### Validation

- the `up` query returned healthy results for configured scrape jobs
- the `probe_success` query returned healthy results for DNS probe targets

![Grafana up query](../../screenshots/phase-4/11-grafana-up-query.png)

![Grafana probe_success query](../../screenshots/phase-4/12-grafana-probe-success-query.png)

---

## 5. Configure Blackbox Exporter 🌐

Blackbox Exporter was configured to perform DNS-based probes against the HA DNS service path.

### Probe type used

- UDP DNS probe
- query name: `google.com`
- query type: `A`
- recursion desired: `true`

### Validation

- `probe_success` returned `1` for:
  - the VIP
  - `ashpi-1`
  - `ashpi-2`

![Grafana probe_success query](../../screenshots/phase-4/12-grafana-probe-success-query.png)

---

## 6. Install Node Exporter on ashpi-1 📈

Node Exporter was installed on `ashpi-1` to expose Linux host metrics.

### Tasks completed

1. created the `node_exporter` service account
2. downloaded the Node Exporter binary
3. copied it to `/usr/local/bin`
4. created the systemd service
5. enabled and started the service

### Validation

- `systemctl status node_exporter` showed the service as active
- `curl http://localhost:9100/metrics | head` returned metrics successfully

![ashpi-1 Node Exporter status](../../screenshots/phase-4/08-node-exporter-ashpi1-status.png)

![ashpi-1 Node Exporter metrics](../../screenshots/phase-4/09-node-exporter-ashpi1-metrics.png)

---

## 7. Install Node Exporter on ashpi-2 📈

The same Node Exporter process was repeated on `ashpi-2`.

### Validation

- `systemctl status node_exporter` showed the service as active
- `curl http://localhost:9100/metrics | head` returned metrics successfully

![ashpi-2 Node Exporter status and metrics](../../screenshots/phase-4/10-node-exporter-ashpi2-status-metrics.png)

---

## 8. Provision Grafana and Confirm the Data Source 📊

Grafana was configured with Prometheus as the default data source.

### Tasks completed

1. started Grafana through Docker Compose
2. logged in with the local admin account
3. confirmed Prometheus was available as a data source
4. used Explore to validate live queries

### Validation queries used

```promql
up
```

```promql
probe_success
```

### Validation

- Grafana successfully returned live Prometheus data
- both dashboards could be built from the query results

![Grafana home](../../screenshots/phase-4/06-grafana-home.png)

![Prometheus datasource configured](../../screenshots/phase-4/07-prometheus-datasource.png)

![Grafana up query](../../screenshots/phase-4/11-grafana-up-query.png)

![Grafana probe_success query](../../screenshots/phase-4/12-grafana-probe-success-query.png)

---

## 9. Build the Dashboards 📋

Two dashboards were created.

### Node Health

Panels included:

- Node Up
- CPU Used %
- Memory Used %
- Root Disk Free %
- Uptime

### DNS & Failover

Panels included:

- VIP DNS Success
- Per-node DNS Success
- VIP DNS Probe Duration
- Per-node DNS Probe Duration
- Active Alerts

### Validation

- both dashboards rendered correct data
- stat panels were adjusted to use:
  - Instant query mode
  - Last not null
- time-series panels showed historical trends correctly

![Node Health dashboard](../../screenshots/phase-4/14-node-health-dashboard.png)

![DNS & Failover dashboard](../../screenshots/phase-4/15-dns-failover-dashboard.png)

---

## 10. Configure Alert Rules 🚨

Prometheus alert rules were added for:

- VIP DNS down
- single node down
- both nodes down
- VIP DNS latency high
- direct DNS node probe failure

### Design choices

- `for:` durations were used to reduce alert noise
- critical alerts were reserved for service-impact conditions
- healthy failover was not treated as a critical outage

### Validation

- alert rules loaded successfully
- Grafana displayed the Prometheus alert rules
- test alerts could be triggered and cleared

![Grafana test alert](../../screenshots/phase-4/16-grafana-test-alert.png)

---

## 11. Configure Discord Alert Delivery 🔔

Discord notifications were configured through Alertmanager using an existing Discord webhook.

### Final alert path

```text
Prometheus alert.rules.yml
        ↓
Alertmanager
        ↓
Discord webhook
        ↓
homelab-alerts
```

### Tasks completed

1. created a local Alertmanager secrets folder
2. stored the Discord webhook URL in a local secret file
3. mounted the secret into the Alertmanager container as read-only
4. updated `alertmanager.yml` to use `webhook_url_file`
5. added the secret path to `.gitignore`
6. recreated the Alertmanager container so the new volume mount would apply
7. tested Alertmanager delivery to Discord

### Secret file path on the Docker host

```text
alertmanager/secrets/discord_webhook_url
```

### Secret file path inside the Alertmanager container

```text
/etc/alertmanager/secrets/discord_webhook_url
```

### Docker Compose mount

```yaml
- ./alertmanager/secrets:/etc/alertmanager/secrets:ro
```

### Alertmanager Discord receiver pattern

```yaml
receivers:
  - name: discord-home-lab
    discord_configs:
      - webhook_url_file: /etc/alertmanager/secrets/discord_webhook_url
        send_resolved: true
```

### Important fix

After adding the new secret volume, the Alertmanager container had to be recreated, not just restarted.

```bash
docker compose up -d --force-recreate alertmanager
```

### Validation

- the webhook file existed on the Docker host
- the webhook file existed inside the Alertmanager container
- Alertmanager logs showed successful configuration loading
- a manual test alert was routed through Alertmanager
- Discord received the alert

---

## 12. Validate Alert Lifecycle ✅

A single-node-down test was performed by stopping Node Exporter on `ashpi-2`.

### Validation steps

1. stopped Node Exporter on `ashpi-2`
2. observed alert move to pending
3. observed alert move to firing
4. confirmed Discord alert delivery through Alertmanager
5. restored Node Exporter
6. observed the alert clear
7. confirmed resolved notification behavior

### Result

The alert lifecycle behaved as expected from pending → firing → cleared.

![Single node down firing](../../screenshots/phase-4/18-single-node-down-firing.png)

![Single node down cleared](../../screenshots/phase-4/19-single-node-down-cleared.png)

---

## 13. Validate Failover Monitoring 🔁

A keepalived failover test was performed to confirm monitoring reflected healthy failover correctly.

### Validation steps

1. identified the current VIP owner
2. stopped keepalived on the active node
3. confirmed the VIP moved to the standby node
4. confirmed VIP DNS probes remained healthy
5. confirmed no false critical outage alert fired
6. restored keepalived

### Result

Monitoring correctly reflected a healthy failover event without misclassifying it as a service outage.

![VIP owner before failover](../../screenshots/phase-4/21-vip-owner-before-failover.png)

![Dashboards healthy before failover](../../screenshots/phase-4/22-dashboards-healthy-before-failover.png)

![VIP owner after failover](../../screenshots/phase-4/23-vip-owner-after-failover.png)

![VIP probe during failover](../../screenshots/phase-4/24-vip-probe-during-failover.png)

![Node DNS probes during failover](../../screenshots/phase-4/25-node-dns-probes-during-failover.png)

![Alert state during failover](../../screenshots/phase-4/26-alert-state-during-failover.png)

![DNS dashboard during failover](../../screenshots/phase-4/27-dns-dashboard-during-failover.png)

![Failover restored](../../screenshots/phase-4/28-failover-restored.png)

---

## 14. Back Up the Monitoring Configuration 💾

The monitoring configuration was archived from the monitoring host.

### Validation

- backup archive was created successfully
- dashboard JSON exports were preserved for reuse
- webhook secrets were not included in Git

![Monitoring backup created](../../screenshots/phase-4/20-monitoring-backup-created.png)

---

## 🏁 Result

Phase 4 completed the observability and alerting layer for the HA DNS environment by adding:

- host-level monitoring
- DNS path monitoring
- failover-aware dashboards
- service-impact-driven alerting
- Alertmanager-based Discord notifications
- validated alert lifecycle behavior
