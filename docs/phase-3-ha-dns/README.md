# Phase 3 - High Availability DNS 🔁

![Status](https://img.shields.io/badge/status-complete-brightgreen)
![DNS](https://img.shields.io/badge/dns-Pi--hole%20HA-success)
![Failover](https://img.shields.io/badge/failover-Keepalived-blue)
![Sync](https://img.shields.io/badge/sync-Gravity%20Sync-purple)
![Resolver](https://img.shields.io/badge/resolver-Unbound-orange)

## Phase Summary

Phase 3 removed DNS as a single point of failure by building a high availability Pi-hole DNS setup.

This phase added a second Pi-hole node, a shared virtual IP, configuration synchronization, local recursive DNS, and failover validation.

---

## What This Phase Demonstrates

| Area | Demonstrated Skill |
|---|---|
| High availability | Shared DNS VIP using Keepalived |
| DNS redundancy | Primary and backup Pi-hole nodes |
| Configuration sync | Gravity Sync replication |
| Recursive DNS | Local Unbound resolver |
| Failover testing | Manual failure and recovery validation |
| Documentation | Diagrams, validation notes, and screenshots |

---

## Final HA DNS Design

    Clients
      ↓
    Pi-hole HA VIP - 192.168.68.20
      ↓
    Active Pi-hole Node
      ↓
    Local Unbound Recursive Resolver

    ashpi-1 - Primary Pi-hole Node
    ashpi-2 - Backup Pi-hole Node

---

## Phase Documentation

| Page | Description |
|---|---|
| [Overview](overview.md) | Case-study overview of the HA DNS design |
| [Step-by-Step Guide](step-by-step.md) | Implementation flow |
| [Jump Box Access](jump-box-access.md) | SSH and access notes |
| [Validation and Failover Tests](validation-failover-tests.md) | Failover proof and testing |
| [Diagrams](diagrams.md) | Phase-specific architecture |
| [DNS Recursion with Unbound](DNS-recursion-unbound.md) | Recursive DNS configuration notes |

---

## Key Services

| Service | Role |
|---|---|
| Pi-hole | DNS filtering and visibility |
| Keepalived | Virtual IP failover |
| Gravity Sync | Pi-hole configuration replication |
| Unbound | Local recursive DNS resolver |

---

## Outcome

At the end of this phase, DNS could continue functioning even if one Pi-hole node went offline.

This made the home network DNS layer more resilient and operationally realistic.
