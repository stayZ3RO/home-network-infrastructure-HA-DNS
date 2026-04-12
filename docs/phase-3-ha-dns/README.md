# Phase 3: High Availability DNS (HA-DNS)

## Overview

In this phase, I expanded my homelab from a single-node DNS setup to a **highly available DNS infrastructure** using:

- `Pi-hole` (Primary + Secondary)
- `keepalived` (failover with Virtual IP)
- `gravity-sync` (synchronization)
- SSH **jump box** model for secure access

---

## Goals

- Eliminate single point of failure
- Ensure DNS remains available during outages
- Synchronize configurations across nodes
- Improve administrative access and security

---

## Components

| Component       | Purpose                          |
|----------------|----------------------------------|
| Pi-hole        | DNS filtering / ad blocking      |
| keepalived     | High availability (VIP failover) |
| gravity-sync   | Sync Pi-hole configs             |
| SSH Jump Box   | Secure centralized access        |

---

## Documentation

- [Phase 3 Overview](./overview.md)
- [Step-by-Step Guide](./step-by-step.md)
- [Jump Box Access](./jump-box-access.md)
- [Validation & Failover Testing](./validation-and-failover-tests.md)
- [Diagrams](./diagrams.md)

---

## Outcome

This phase transforms the lab into a **production-style HA DNS system** with:

- Automatic failover
- Data consistency between nodes
- Secure and structured access
