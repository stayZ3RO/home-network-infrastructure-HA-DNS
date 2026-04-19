# Phase 4 — Monitoring & Alerting 📈

## Overview

This phase documents the observability layer for the HA DNS platform.

By the end of Phase 4, the lab includes:

* Prometheus for metrics collection and alert rule evaluation
* Grafana for dashboards and query validation
* Alertmanager for alert state handling
* Blackbox Exporter for DNS probe testing
* Node Exporter on both Raspberry Pi nodes
* failover-aware monitoring for the HA DNS VIP

## Documents

* [Overview](overview.md)
* [Step-by-Step Guide](step-by-step.md)
* [Dashboards](dashboards.md)
* [Alerting](alerting.md)
* [Validation](validation.md)

## Screenshot Assets

Phase 4 screenshots now use a dedicated folder:

* [`../../screenshots/phase-4/`](../../screenshots/phase-4/README.md)

The repository currently includes **SVG placeholder assets** so markdown image links resolve cleanly on GitHub. Replace each placeholder with the real screenshot while keeping the same filename.

## Suggested Review Order

1. Read the [overview](overview.md)
2. Follow the [step-by-step guide](step-by-step.md)
3. Review the [dashboards](dashboards.md) and [alerting](alerting.md)
4. Use [validation](validation.md) as proof of implementation
