# Phase 4 — Monitoring & Alerting Overview 📈

## 📖 Overview

Phase 4 adds the **observability layer** to the HA DNS platform completed in Phase 3.

By the end of Phase 3, the lab already had:

- dual Pi-hole nodes
- Gravity Sync replication
- keepalived VIP-based failover
- Unbound recursive DNS on both nodes
- validated DNS continuity during failover

Phase 4 builds on that foundation by introducing monitoring, dashboards, alert rules, Alertmanager routing, and Discord alert delivery.

---

## 🎯 Objectives

The goals of this phase were to:

- monitor the health of both Raspberry Pi nodes
- monitor the HA DNS VIP and direct node DNS endpoints
- track host resource usage over time
- create dashboards for quick operational visibility
- implement alerting with reduced noise
- validate alert lifecycle behavior
- configure Discord notifications through Alertmanager
- confirm monitoring reflects healthy failover correctly

---

## 🧱 Monitoring Stack

The monitoring stack introduced in this phase includes:

### Prometheus

Prometheus was used as the metrics collection and alert rule engine.

### Grafana

Grafana was used for:

- dashboard creation
- metric visualization
- query testing through Explore
- alert state visibility

### Alertmanager

Alertmanager was used to:

- receive alerts from Prometheus
- group and route alerts
- send alert notifications to Discord
- send resolved notifications after recovery

### Blackbox Exporter

Blackbox Exporter was used to probe:

- the HA DNS VIP
- `ashpi-1` direct DNS
- `ashpi-2` direct DNS

### Node Exporter

Node Exporter was installed on both Raspberry Pi nodes to expose host-level system metrics such as:

- CPU usage
- memory usage
- disk usage
- uptime
- node availability

---

## 🖥️ Monitoring Host Design

For Phase 4, the monitoring stack was deployed on a Docker VM / monitoring host using Docker Compose.

The stack was later confirmed running with:

- Grafana
- Prometheus
- Alertmanager
- Blackbox Exporter

![Docker working inside Ubuntu WSL](../../screenshots/phase-4/00-docker-working-in-wsl.png)

![Monitoring containers running](../../screenshots/phase-4/13-docker-containers-running.png)

---

## 🌐 Monitored Endpoints

The following targets were monitored during this phase:

- `ashpi-1` node metrics — `192.168.68.60:9100`
- `ashpi-2` node metrics — `192.168.68.61:9100`
- HA DNS VIP probe — `192.168.68.20:53`
- `ashpi-1` direct DNS probe — `192.168.68.60:53`
- `ashpi-2` direct DNS probe — `192.168.68.61:53`

---

## 🛡️ Security Approach

The monitoring stack was intentionally kept **LAN-only**.

Key security decisions included:

- only Grafana was published on port `3000`
- Prometheus was not exposed directly
- Alertmanager was not exposed directly
- Blackbox Exporter was not exposed directly
- Node Exporter was not exposed through the router
- no monitoring services were port-forwarded to the internet
- the Discord webhook URL was stored locally as a secret file
- the webhook secret was excluded from Git using `.gitignore`

---

## 📊 Dashboards Created

Two primary dashboards were created.

### 1. Node Health

This dashboard focused on host-level visibility for both Raspberry Pi nodes.

It included:

- node up/down state
- CPU usage
- memory usage
- root disk free percentage
- uptime

![Node Health dashboard](../../screenshots/phase-4/14-node-health-dashboard.png)

### 2. DNS & Failover

This dashboard focused on the DNS service path and HA behavior.

It included:

- VIP DNS success
- per-node DNS success
- VIP probe duration
- per-node probe duration
- active alerts

![DNS & Failover dashboard](../../screenshots/phase-4/15-dns-failover-dashboard.png)

---

## 🚨 Alerting Strategy

The alerting model focused on **service impact first**.

### Critical Alerts

- VIP DNS down
- both nodes down

### Warning Alerts

- single node down
- direct DNS node probe failed
- elevated VIP DNS latency

### Informational / Degraded State

- failover-related conditions where redundancy is degraded but service remains available

This helped reduce noise and avoid treating a healthy failover as a critical outage.

![Single node down alert firing](../../screenshots/phase-4/18-single-node-down-firing.png)

![Single node down alert cleared](../../screenshots/phase-4/19-single-node-down-cleared.png)

---

## 🔔 Discord Alert Delivery

Discord notifications were added through Alertmanager.

The final alert path is:

```text
Prometheus alert.rules.yml
        ↓
Alertmanager
        ↓
Discord webhook
        ↓
homelab-alerts
```

The webhook URL is stored locally at:

```text
alertmanager/secrets/discord_webhook_url
```

The secret is mounted into the Alertmanager container as read-only:

```text
/etc/alertmanager/secrets/discord_webhook_url
```

This keeps the webhook out of the public GitHub repository.

---

## ✅ Validation Summary

Phase 4 was validated by confirming:

- both Node Exporter targets were scraped successfully
- Blackbox DNS probes succeeded for the VIP and both nodes
- Grafana dashboards showed correct live state
- alert rules loaded successfully
- a single-node-down alert moved from pending → firing → cleared
- Alertmanager successfully routed alerts to Discord
- keepalived failover was reflected correctly in monitoring
- the VIP remained healthy during failover
- no false critical outage alert was triggered during a healthy failover
- the monitoring configuration was backed up successfully

![VIP owner before failover](../../screenshots/phase-4/21-vip-owner-before-failover.png)

![VIP owner after failover](../../screenshots/phase-4/23-vip-owner-after-failover.png)

![DNS dashboard during failover](../../screenshots/phase-4/27-dns-dashboard-during-failover.png)

![Monitoring backup created](../../screenshots/phase-4/20-monitoring-backup-created.png)

---

## 🏁 Outcome

Phase 4 completed the observability and alerting layer for the HA DNS environment.

At the end of this phase, the lab had:

- host health visibility
- DNS availability monitoring
- failover-aware dashboards
- Prometheus alert rules
- Alertmanager routing
- Discord alert delivery
- a safer LAN-only monitoring posture

---

## 🚀 Next Step

With monitoring and alerting complete, the next phase is **secure remote access** and administrative path hardening.
