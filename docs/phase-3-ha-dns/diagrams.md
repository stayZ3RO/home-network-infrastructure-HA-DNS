# Phase 3 — HA DNS Diagrams 🧭

---

## Quick Navigation

| Page | Link |
|---|---|
| Phase Home | [README](README.md) |
| Overview | [overview.md](overview.md) |
| Step-by-Step Guide | [step-by-step.md](step-by-step.md) |
| Jump Box Access | [jump-box-access.md](jump-box-access.md) |
| Validation and Failover Tests | [validation-failover-tests.md](validation-failover-tests.md) |
| Diagrams | [diagrams.md](diagrams.md) |
| DNS Recursion with Unbound | [DNS-recursion-unbound.md](DNS-recursion-unbound.md) |
| Documentation Hub | [docs/](../README.md) |

---


## 📖 Purpose

This document provides visual references for the Phase 3 HA DNS design.

The goal of Phase 3 was to remove the single point of failure from the DNS layer by adding:

- a second Pi-hole node
- Gravity Sync replication
- keepalived VIP failover
- local Unbound recursion on both nodes

---

## 🧱 High-Level DNS Architecture

```text
Internet
  ↓
AT&T Fiber
  ↓
ONT
  ↓
AT&T Gateway / IP Passthrough
  ↓
Deco Mesh Router
  ↓
Clients
  ↓
Virtual IP: 192.168.68.20
  ↓
Active Pi-hole Node
  ↓
Local Unbound Resolver
  ↓
Recursive DNS Resolution
```

---

## ⚖️ Normal State

```text
Clients
  ↓
DNS VIP: 192.168.68.20
  ↓
ashpi-1 / Primary Node
  ├── Pi-hole
  ├── Unbound
  └── keepalived MASTER

ashpi-2 / Secondary Node
  ├── Pi-hole
  ├── Unbound
  └── keepalived BACKUP
```

In the normal state, `ashpi-1` owns the VIP and handles client DNS traffic.

---

## 🔁 Failover State

```text
Clients
  ↓
DNS VIP: 192.168.68.20
  ↓
ashpi-2 / Secondary Node
  ├── Pi-hole
  ├── Unbound
  └── keepalived ACTIVE

ashpi-1 / Primary Node
  └── unavailable or temporarily stopped
```

During failover, `ashpi-2` takes over the VIP and continues serving DNS.

---

## 🔄 Gravity Sync Flow

```text
ashpi-1 / Primary Pi-hole
  ↓
Gravity Sync
  ↓
ashpi-2 / Secondary Pi-hole
```

Gravity Sync keeps important Pi-hole configuration aligned between both nodes.

---

## 🌐 Unbound Recursive DNS Flow

```text
Client
  ↓
DNS VIP
  ↓
Active Pi-hole Node
  ↓
127.0.0.1#5335
  ↓
Local Unbound Resolver
  ↓
Root DNS / Authoritative DNS
```

Each Pi-hole node uses its own local Unbound instance.

This avoids relying on a public upstream resolver and keeps recursive DNS available on whichever node owns the VIP.

---

## 🧩 Component Relationship

```text
                ┌─────────────────────┐
                │       Clients       │
                └──────────┬──────────┘
                           │
                           ↓
                ┌─────────────────────┐
                │ DNS VIP 192.168.68.20│
                └──────────┬──────────┘
                           │
              ┌────────────┴────────────┐
              │                         │
              ↓                         ↓
┌────────────────────────┐   ┌────────────────────────┐
│ ashpi-1                │   │ ashpi-2                │
│ Primary DNS Node       │   │ Secondary DNS Node     │
│                        │   │                        │
│ Pi-hole                │   │ Pi-hole                │
│ Unbound                │   │ Unbound                │
│ keepalived MASTER      │   │ keepalived BACKUP      │
└────────────────────────┘   └────────────────────────┘
              │                         │
              └────────────┬────────────┘
                           ↓
                ┌─────────────────────┐
                │   Gravity Sync       │
                │ Config Replication   │
                └─────────────────────┘
```

---

## 🏁 Result

The final Phase 3 architecture provides:

- redundant DNS nodes
- synchronized Pi-hole configuration
- VIP-based DNS failover
- local recursive DNS resolution
- validated client DNS continuity
- validated ad blocking after failover
