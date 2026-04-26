# Phase 4 — Validation 🧪

## 📖 Purpose

This document captures the validation steps used to confirm that the monitoring and alerting stack works correctly for the HA DNS environment.

The validation process focused on:

- successful scraping of node metrics
- successful probing of DNS endpoints
- dashboard correctness
- alert lifecycle behavior
- Discord notification delivery
- healthy failover visibility

---

## Validation 1 — Prometheus Scrape Health 📡

### Queries used

```promql
up
```

### Expected result

Healthy values should be returned for:

- Prometheus
- Alertmanager
- Blackbox Exporter
- `192.168.68.60:9100`
- `192.168.68.61:9100`

### Result

Passed ✅

Both Raspberry Pi nodes were successfully scraped through Node Exporter.

![Grafana up query](../../screenshots/phase-4/11-grafana-up-query.png)

---

## Validation 2 — DNS Probe Success 🌐

### Query used

```promql
probe_success
```

### Expected result

Healthy values should be returned for:

- `192.168.68.20:53`
- `192.168.68.60:53`
- `192.168.68.61:53`

### Result

Passed ✅

The VIP and both direct DNS node endpoints were successfully probed.

![Grafana probe_success query](../../screenshots/phase-4/12-grafana-probe-success-query.png)

---

## Validation 3 — Dashboard Rendering 📊

### Validation performed

Confirmed that both dashboards rendered correct live data:

- **Phase 4 — Node Health**
- **Phase 4 — DNS & Failover**

### Additional cleanup performed

- stat panels switched to Instant mode
- stat panels configured to use Last not null
- time ranges adjusted to remove confusion from old placeholder history

### Result

Passed ✅

![Node Health dashboard](../../screenshots/phase-4/14-node-health-dashboard.png)

![DNS & Failover dashboard](../../screenshots/phase-4/15-dns-failover-dashboard.png)

---

## Validation 4 — Alert Rule Loading 🚨

### Validation performed

Prometheus alert rules were loaded and displayed in Grafana under the Prometheus rule source.

### Expected result

- alert rules are visible in Grafana
- rule groups load without YAML errors
- alert states can be viewed from Grafana

### Result

Passed ✅

![Grafana test alert](../../screenshots/phase-4/16-grafana-test-alert.png)

---

## Validation 5 — SingleNodeDown Alert Lifecycle 🔁

### Test action

Stopped Node Exporter on `ashpi-2`.

### Expected result

The `SingleNodeDown` alert should:

1. enter pending
2. transition to firing after the configured `for:` duration
3. clear after Node Exporter is restored

### Result

Passed ✅

The full pending → firing → cleared lifecycle was observed successfully.

![Single node down firing](../../screenshots/phase-4/18-single-node-down-firing.png)

![Single node down cleared](../../screenshots/phase-4/19-single-node-down-cleared.png)

---

## Validation 6 — Discord Alert Delivery 🔔

### Validation performed

Discord notification delivery was tested through Alertmanager.

### Expected result

- Alertmanager reads the Discord webhook from a local secret file
- Alertmanager sends firing notifications to Discord
- Alertmanager sends resolved notifications when `send_resolved: true` is enabled
- the webhook URL is not committed to GitHub

### Result

Passed ✅

During testing, Alertmanager initially failed because the webhook file was not visible inside the container.

The issue was corrected by:

1. confirming the secret existed on the Docker host
2. mounting `./alertmanager/secrets` into the container
3. recreating the Alertmanager container with `--force-recreate`
4. verifying the webhook file existed inside `/etc/alertmanager/secrets`
5. sending a manual test alert to Alertmanager

The final working path was:

```text
Prometheus alert.rules.yml
        ↓
Alertmanager
        ↓
Discord webhook
        ↓
homelab-alerts
```

---

## Validation 7 — Failover Monitoring Behavior 🔁

### Test action

Stopped keepalived on the current VIP owner.

### Expected result

- the VIP moves to the standby node
- DNS service through the VIP remains available
- `probe_success{job="dns_vip"}` remains healthy
- no false critical outage alert fires

### Result

Passed ✅

Monitoring correctly reflected healthy failover without misclassifying it as a service outage.

![VIP owner before failover](../../screenshots/phase-4/21-vip-owner-before-failover.png)

![VIP owner after failover](../../screenshots/phase-4/23-vip-owner-after-failover.png)

![VIP probe during failover](../../screenshots/phase-4/24-vip-probe-during-failover.png)

![Node DNS probes during failover](../../screenshots/phase-4/25-node-dns-probes-during-failover.png)

---

## Validation 8 — Dashboard Visibility During Failover 📋

### Validation performed

Observed the **DNS & Failover** dashboard during the keepalived failover event.

### Expected result

- VIP DNS Success remains healthy
- Per-node DNS Success remains healthy
- no critical VIP outage alert appears during a healthy failover
- active alerts reflect real conditions rather than false outages

### Result

Passed ✅

![Alert state during failover](../../screenshots/phase-4/26-alert-state-during-failover.png)

![DNS dashboard during failover](../../screenshots/phase-4/27-dns-dashboard-during-failover.png)

![Failover restored](../../screenshots/phase-4/28-failover-restored.png)

---

## Validation 9 — Monitoring Configuration Backup 💾

### Validation performed

Created a compressed archive of the monitoring configuration from the monitoring host.

### Expected result

- backup file is created successfully
- dashboard exports are preserved for reuse
- secrets are excluded from Git

### Result

Passed ✅

![Monitoring backup created](../../screenshots/phase-4/20-monitoring-backup-created.png)

---

## 🏁 Conclusion

Phase 4 validation confirmed that the environment now has:

- working host-level monitoring
- working DNS probe monitoring
- working dashboards
- validated alert lifecycle behavior
- working Discord alert delivery through Alertmanager
- accurate visibility into healthy HA failover
- backed-up monitoring configuration

This completes the observability and alerting phase of the project.
