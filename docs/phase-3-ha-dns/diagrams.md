# Phase 3 — HA DNS Diagrams 🧭

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

## ⚖️ VIP Ownership — Normal State

```text
Clients
  ↓
DNS VIP: 192.168.68.20
  ↓
ashpi-1 / Primary
  ├── Pi-hole
  ├── Unbound
  └── keepalived MASTER

ashpi-2 / Secondary
  ├── Pi-hole
  ├── Unbound
  └── keepalived BACKUP
```

Supporting screenshots:

![VIP assigned primary node](../../screenshots/phase-3/12-vip-assigned-primary-node.png)

![VIP active on primary node](../../screenshots/phase-3/13-vip-active-on-primary-node.png)

---

## 🔁 VIP Ownership — Failover State

```text
Clients
  ↓
DNS VIP: 192.168.68.20
  ↓
ashpi-2 / Secondary
  ├── Pi-hole
  ├── Unbound
  └── keepalived ACTIVE

ashpi-1 / Primary
  └── unavailable or temporarily stopped
```

Supporting screenshots:

![Before failover primary active](../../screenshots/phase-3/14-before-failover-primary-active.png)

![Failover triggered](../../screenshots/phase-3/15-failover-triggered.png)

![After failover secondary active](../../screenshots/phase-3/16-after-failover-secondary-active.png)

![DNS active after failover](../../screenshots/phase-3/17-dns-active-after-failover.png)

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

Supporting screenshots:

![Gravity Sync config complete](../../screenshots/phase-3/7-gravity-sync-config-complete.png)

![Gravity Sync push confirmed](../../screenshots/phase-3/8-gravity-sync-push-confirmed.png)

![Gravity Sync compare confirmed](../../screenshots/phase-3/9-gravity-sync-compare-confirmed.png)

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

Supporting screenshots:

![Unbound active on pi1](../../screenshots/phase-3/20-unbound-active-on-pi1.png)

![Pi 2 Unbound active](../../screenshots/phase-3/24-pi2-unbound-active.png)

![Client DNS test after failover](../../screenshots/phase-3/34-client-dns-test-after-failover.png)

---

## 🏁 Result

The final Phase 3 architecture provides:

- redundant DNS nodes
- synchronized Pi-hole configuration
- VIP-based DNS failover
- local recursive DNS resolution
- validated client DNS continuity
- validated ad blocking after failover
