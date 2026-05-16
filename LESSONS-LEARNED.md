# Lessons Learned 🧠

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![Focus](https://img.shields.io/badge/focus-network%20infrastructure-blue)
![Validation](https://img.shields.io/badge/validation-tested-success)

## Overview

This file captures the major lessons learned while building the Home Network Infrastructure Lab.

The project evolved from basic DNS control into a larger infrastructure foundation that included HA DNS, recursive DNS, monitoring, alerting, secure remote access, Proxmox services, and self-hosted remote access.

---

## 1. Build the Baseline Before Adding Complexity

The early phases focused on understanding the network before adding more advanced services.

Key lesson:

A stable baseline makes every later phase easier to validate.

Before adding HA DNS, monitoring, or remote access, it helped to understand:

- ISP gateway behavior
- Router role
- DHCP behavior
- DNS path
- Client behavior
- Existing network limitations

---

## 2. ISP Equipment Changes the Network Design

The migration from Xfinity to AT&T Fiber introduced an important distinction:

| ISP Setup | Behavior |
| --- | --- |
| Xfinity bridge mode | Gateway behaves more like a modem |
| AT&T IP Passthrough | Gateway still exists in the path but passes public IP behavior downstream |

This affected how the topology was documented and how routing responsibilities were understood.

Key lesson:

ISP gateway behavior matters. Bridge mode and IP Passthrough are not always identical operationally.

---

## 3. DNS Control Is a Strong First Infrastructure Project

Pi-hole provided a practical entry point into network services.

It made DNS visible and measurable.

Useful outcomes:

- Centralized query visibility
- DNS filtering
- Client behavior visibility
- Clear before-and-after validation
- Foundation for HA DNS

Key lesson:

DNS is a high-value service to understand because almost every networked device depends on it.

---

## 4. High Availability Requires Validation, Not Assumptions

Adding a second Pi-hole node was not enough by itself.

The HA DNS design needed:

- Keepalived for VIP failover
- Gravity Sync for configuration consistency
- Unbound on both nodes
- Failover testing
- Service restoration testing

Key lesson:

HA is not complete until failover and recovery are tested.

---

## 5. Recursive DNS Improved the Lab Value

Adding Unbound made the project more than basic ad-blocking DNS.

It introduced recursive DNS behavior and reduced dependency on public upstream resolvers.

Key lesson:

Unbound turned the DNS setup into a better learning project because it added resolver behavior, caching, and local recursion.

---

## 6. Monitoring Changed the Project from Static to Operational

Prometheus, Grafana, Blackbox Exporter, Node Exporter, and Alertmanager added operational visibility.

Instead of only checking services manually, the lab gained:

- Service availability checks
- Host metrics
- DNS endpoint visibility
- Dashboards
- Alert notifications
- Failure-state validation

Key lesson:

Monitoring turns infrastructure from “configured” into “operated.”

---

## 7. Alerts Need Real Testing

Alerting is only useful if it is tested.

During the project, alerts were validated by intentionally creating failure conditions and confirming:

- Alert pending state
- Alert firing state
- Discord delivery
- Recovery behavior

Key lesson:

A dashboard shows state. An alert proves response behavior.

---

## 8. Tailscale Reduced the Need for Public Exposure

Tailscale provided remote administration without opening public inbound ports.

This supported secure access to:

- Raspberry Pi nodes
- Proxmox
- Internal services
- Remote SSH workflows
- Mobile admin testing

Key lesson:

Private overlay networking is safer than exposing management services publicly.

---

## 9. Proxmox Created a Better Infrastructure Foundation

Moving services into Proxmox helped separate infrastructure workloads from a general-purpose workstation.

Benefits:

- Dedicated service hosting
- Better VM/LXC organization
- Clearer infrastructure boundaries
- Easier future expansion
- Better documentation structure

Key lesson:

Virtualization made the lab feel more like real infrastructure instead of a collection of one-off services.

---

## 10. RustDesk Was Useful When Kept LAN-Only

Self-hosted RustDesk added practical remote access experience, but it was intentionally kept LAN-only for this project.

Key lesson:

Not every useful service needs to be public. Internal-only services can still provide real operational value.

---

## 11. Screenshots Are Proof, Not Decoration

Screenshots helped prove that each phase was configured and validated.

Strong screenshots include:

- Before-and-after states
- Service status
- Dashboard views
- Failover evidence
- Alert evidence
- Remote access validation
- VM/service layout

Key lesson:

Good screenshots make a technical project more credible and easier to review.

---

## 12. Documentation Is Part of the Engineering Work

The repo became stronger as the documentation became more structured.

Useful documentation patterns:

- Phase overview
- Step-by-step guide
- Validation page
- Architecture diagram
- Screenshot evidence
- Lessons learned
- Current status
- Roadmap
- Changelog

Key lesson:

The project is not only what was built. It is also how clearly the build is explained.

---

## Final Takeaway

This project established a complete home infrastructure foundation.

It demonstrated:

- Network understanding
- DNS control
- High availability design
- Recursive DNS
- Monitoring
- Alerting
- Secure remote access
- Virtualization
- Self-hosted services
- Documentation discipline

The next logical step is a separate segmentation project focused on managed routing, switching, VLANs, and firewall policy.
