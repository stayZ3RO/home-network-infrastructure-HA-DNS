# Phase 4 — Validation 🧪

## 📖 Purpose

This document captures the validation steps used to confirm that the monitoring and alerting stack works correctly for the HA DNS environment.

The validation process focused on:

* successful scraping of node metrics
* successful probing of DNS endpoints
* dashboard correctness
* alert lifecycle behavior
* healthy failover visibility

---

## Validation 1 — Prometheus Scrape Health 📡

### Queries used

```promql
up
```

### Expected result

Healthy values should be returned for:

* Prometheus
* Alertmanager
* Blackbox Exporter
* `192.168.68.60:9100`
* `192.168.68.61:9100`

### Result

Passed ✅

Both Raspberry Pi nodes were successfully scraped through Node Exporter.

---

## Validation 2 — DNS Probe Success 🌐

### Query used

```promql
probe_success
```

### Expected result

Healthy values should be returned for:

* `192.168.68.20:53`
* `192.168.68.60:53`
* `192.168.68.61:53`

### Result

Passed ✅

The VIP and both direct DNS node endpoints were successfully probed.

---

## Validation 3 — Dashboard Rendering 📊

### Validation performed

Confirmed that both dashboards rendered correct live data:

* **Phase 4 — Node Health**
* **Phase 4 — DNS & Failover**

### Additional cleanup performed

* stat panels switched to Instant mode
* stat panels configured to use Last not null
* time ranges adjusted to remove confusion from old placeholder history

### Result

Passed ✅

---

## Validation 4 — SingleNodeDown Alert Lifecycle 🚨

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

---

## Validation 5 — Failover Monitoring Behavior 🔁

### Test action

Stopped keepalived on the current VIP owner.

### Expected result

* the VIP moves to the standby node
* DNS service through the VIP remains available
* `probe_success{job="dns_vip"}` remains healthy
* no false critical outage alert fires

### Result

Passed ✅

Monitoring correctly reflected healthy failover without misclassifying it as a service outage.

---

## Validation 6 — Dashboard Visibility During Failover 📋

### Validation performed

Observed the **DNS & Failover** dashboard during the keepalived failover event.

### Expected result

* VIP DNS Success remains healthy
* Per-node DNS Success remains healthy
* no critical VIP outage alert appears during a healthy failover
* active alerts reflect real conditions rather than false outages

### Result

Passed ✅

---

## Validation 7 — Monitoring Configuration Backup 💾

### Validation performed

Created a compressed archive of the monitoring configuration from Ubuntu WSL.

### Expected result

* backup file is created successfully
* dashboard exports are preserved for reuse

### Result

Passed ✅

---

## 📸 Suggested Screenshots

Recommended evidence for this validation document:

* `up` query results
* `probe_success` query results
* alert pending
* alert firing
* alert cleared
* VIP owner before failover
* VIP owner after failover
* DNS dashboard during failover
* monitoring backup file created

---

## 🏁 Conclusion

Phase 4 validation confirmed that the environment now has:

* working host-level monitoring
* working DNS probe monitoring
* working dashboards
* validated alert lifecycle behavior
* accurate visibility into healthy HA failover
* a backed-up monitoring configuration

This completes the observability and alerting phase of the project.
