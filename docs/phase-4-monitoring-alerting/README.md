# Phase 4 - Monitoring and Alerting 📈

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![Monitoring](https://img.shields.io/badge/monitoring-Prometheus-orange)
![Dashboards](https://img.shields.io/badge/dashboards-Grafana-blue)
![Alerts](https://img.shields.io/badge/alerts-Alertmanager-red)
![Notifications](https://img.shields.io/badge/notifications-Discord-purple)

## Phase Summary

Phase 4 added observability to the home infrastructure lab.

This phase introduced Prometheus, Grafana, Alertmanager, Blackbox Exporter, Node Exporter, and Discord alert delivery to monitor service health and validate infrastructure availability.

---

## What This Phase Demonstrates

| Area | Demonstrated Skill |
|---|---|
| Monitoring | Metrics collection with Prometheus |
| Dashboards | Grafana visualization |
| Alerting | Alertmanager routing |
| Availability checks | Blackbox Exporter probing |
| Host metrics | Node Exporter |
| Notifications | Discord alert delivery |
| Validation | Pending, firing, and recovery testing |

---

## Monitoring Flow

    Node Exporter / Blackbox Exporter
      ↓
    Prometheus
      ↓
    Grafana Dashboards
      ↓
    Alertmanager
      ↓
    Discord Alerts

---

## Phase Documentation

| Page | Description |
|---|---|
| [Overview](overview.md) | Monitoring and alerting case study |
| [Step-by-Step Guide](step-by-step.md) | Implementation flow |
| [Dashboards](dashboards.md) | Grafana dashboard notes |
| [Alerting](alerting.md) | Alertmanager and Discord alert routing |
| [Validation](validation.md) | Monitoring and alert testing evidence |

---

## Key Services

| Service | Role |
|---|---|
| Prometheus | Metrics collection |
| Grafana | Dashboard visualization |
| Alertmanager | Alert routing |
| Blackbox Exporter | Endpoint probing |
| Node Exporter | Host metrics |
| Discord Webhooks | Alert notification delivery |

---

## Outcome

At the end of this phase, the lab moved from manually checking services to actively monitoring and validating infrastructure state.

This made the environment more operational and easier to troubleshoot.
