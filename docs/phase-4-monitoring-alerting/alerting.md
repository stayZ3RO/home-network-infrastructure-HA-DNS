# Phase 4 — Alerting 🚨

## 📖 Overview

This document describes the alerting logic used during Phase 4.

The main goal was to build alerts that are:

* useful
* low-noise
* service-impact focused
* aware of the difference between degraded redundancy and real outages

---

## 🎯 Alerting Philosophy

The alerting model used in this phase was based on a simple principle:

**Alert on service impact first.**

That means:

* a healthy failover should not be treated like a critical outage
* losing one node should be treated as degraded redundancy, not total failure
* losing the VIP should be treated as the primary DNS service outage condition

This made the alerts easier to trust and reduced unnecessary noise.

---

## Severity Model

### Critical

Used when DNS service is actually impacted or both HA nodes are unavailable.

### Warning

Used when redundancy or performance is degraded, but service may still be available.

### Informational / degraded state

Used for failover visibility or conditions that indicate HA worked but redundancy changed.

---

## Alert Rules Used

### VIPDNSDown

**Purpose**

Detect when the HA DNS VIP is no longer answering DNS probes.

**Type**

* Critical

**Why it matters**

This is the main service-impact DNS alert for the environment.

---

### SingleNodeDown

**Purpose**

Detect when one monitored Raspberry Pi node is no longer reachable through Node Exporter.

**Type**

* Warning

**Why it matters**

DNS may still be available, but redundancy is degraded.

---

### BothNodesDown

**Purpose**

Detect when both monitored Raspberry Pi nodes are unreachable.

**Type**

* Critical

**Why it matters**

This indicates a major outage condition.

---

### VIPDNSLatencyHigh

**Purpose**

Detect elevated DNS probe response time for the VIP over a sustained window.

**Type**

* Warning

**Why it matters**

This helps identify DNS degradation before a full failure occurs.

---

### DNSNodeProbeFailed

**Purpose**

Detect when direct probing of one Pi-hole DNS endpoint fails.

**Type**

* Warning

**Why it matters**

This helps identify problems on a specific node even if the VIP still appears healthy.

---

## Why `for:` Durations Were Used ⏱️

Each alert rule used a `for:` duration so alerts would not fire immediately on a brief scrape issue or transient network blip.

Examples:

* `1m` for VIP DNS down
* `2m` for single node down
* `10m` for elevated DNS latency
* `15m` for CPU, memory, and disk pressure conditions

This made the alert set much cleaner and reduced flapping.

---

## Active Alert Validation

The alert set was validated by deliberately triggering and restoring conditions.

### SingleNodeDown lifecycle test

A full pending → firing → cleared test was performed by stopping and restoring Node Exporter on `ashpi-2`.

This confirmed:

* the rule loaded successfully
* the `for:` timer behaved correctly
* the alert cleared correctly after recovery

---

## Failover Alert Behavior 🔁

A keepalived failover test was performed during Phase 4 to confirm that monitoring correctly understood a healthy failover.

### Expected behavior during healthy failover

* the VIP moves to the standby node
* DNS service through the VIP remains healthy
* `VIPDNSDown` does **not** fire
* dashboards continue to show service continuity

### Why this matters

This confirms that the monitoring stack can distinguish between:

* a real outage
* a degraded redundancy event
* a healthy HA failover

That distinction is one of the most important outcomes of Phase 4.

---

## Active Alerts in Grafana 📋

The **DNS & Failover** dashboard includes an **Active Alerts** panel so currently pending or firing alerts can be seen directly from the operational dashboard.

This gives a quick summary of alert state without leaving the dashboard view.

---

## Future Alerting Improvements

Later improvements could include:

* notification routing beyond the local UI
* grouped alert handling by severity
* maintenance silencing
* notification integration for email, webhook, or chat tools
* more advanced failover-state alert logic

---

## 🏁 Result

The Phase 4 alerting implementation successfully delivered:

* useful warning and critical conditions
* a cleaner low-noise alert set
* validated alert lifecycle behavior
* correct interpretation of healthy HA failover
