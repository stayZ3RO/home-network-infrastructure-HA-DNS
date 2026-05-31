# Phase 3 — High Availability DNS 🛡️

---

## Quick Navigation

| Page | Link |
|---|---|
| Phase Home | [README](README.md) |
| Overview | [overview.md](overview.md) |
| Step-by-Step Guide | [step-by-step.md](step-by-step.md) |
| Jump Box Access | [jump-box-access.md](jump-box-access.md) |
| Validation and Failover Tests | [validation-and-failover-tests.md](validation-and-failover-tests.md) |
| Diagrams | [diagrams.md](diagrams.md) |
| DNS Recursion with Unbound | [unbound-recursive-dns.md](unbound-recursive-dns.md) |
| Documentation Hub | [docs/](../README.md) |

---


## 📖 Overview

Phase 3 expands the lab from a **single-node Pi-hole deployment** into a **high-availability DNS platform**.

Phase 2 introduced centralized DNS filtering and visibility with Pi-hole, but it still left the environment with a single point of failure. If that Raspberry Pi went down, DNS resolution and ad blocking for the network would go down with it.

To remove that single point of failure, Phase 3 introduced:

- a second Raspberry Pi DNS node
- Gravity Sync for Pi-hole replication
- keepalived for Virtual IP failover
- Unbound on both nodes for recursive DNS resolution
- validation testing for failover and DNS continuity

---

## 🎯 Goals

The goals of this phase were to:

- remove the single-node DNS dependency
- keep Pi-hole configuration synchronized across both nodes
- provide DNS failover through a shared Virtual IP
- add local recursive DNS resolution with Unbound
- validate that DNS stays functional during failover

---

## 🧱 Core Components

### Pi-hole 🕳️

Pi-hole continues to provide:

- DNS filtering
- ad blocking
- local DNS control
- query visibility

### Gravity Sync 🔄

Gravity Sync keeps both Pi-hole nodes aligned by replicating Pi-hole configuration between them.

This helps ensure that:

- blocklists stay consistent
- allowlists and denylists stay consistent
- local DNS records stay consistent
- both nodes behave the same during failover

### keepalived ⚖️

keepalived provides the **Virtual IP**, or **VIP**, that clients use as their DNS target.

Instead of pointing devices directly to one Pi-hole node, clients use the VIP. If the active node fails, the VIP moves to the secondary node.

### Unbound 🌐

Unbound was added to both Pi-hole nodes to provide **local recursive DNS resolution**.

This means each Pi-hole node can resolve DNS queries directly instead of depending on a public upstream DNS provider.

---

## 🧭 Architecture Summary

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
Virtual IP / VIP
  ↓
Active Pi-hole Node
  ↓
Local Unbound Resolver
  ↓
Recursive DNS Resolution
```

---

## ✅ What Was Implemented

This phase included the following work:

- deployed a secondary Raspberry Pi node
- installed Pi-hole on both Raspberry Pi nodes
- configured passwordless SSH between nodes
- configured Gravity Sync between nodes
- configured keepalived with a shared Virtual IP
- validated VIP ownership and failover behavior
- installed Unbound on both Pi-hole nodes
- configured each Pi-hole instance to use its own local Unbound resolver
- validated DNS recursion on both nodes
- validated DNS resolution through the VIP
- validated recursive DNS continuity during failover

---

## 📸 High-Level Evidence

The detailed screenshot walkthrough is documented in the [Step-by-Step Guide](./step-by-step.md). This overview only includes the major proof points.

### Gravity Sync confirmed between nodes

![Gravity Sync compare confirmed](../../screenshots/phase-3/9-gravity-sync-compare-confirmed.png)

### VIP active on the primary node

![VIP active on primary node](../../screenshots/phase-3/13-vip-active-on-primary-node.png)

### VIP moved after failover

![After failover secondary active](../../screenshots/phase-3/16-after-failover-secondary-active.png)

### Client DNS continued after failover

![Client DNS test after failover](../../screenshots/phase-3/34-client-dns-test-after-failover.png)

---

## 🧪 Validation Summary

Phase 3 was considered successful after confirming:

- both Pi-hole nodes were online and functional
- Gravity Sync replicated configuration successfully
- the VIP was initially owned by the primary node
- the VIP moved successfully during failover
- both nodes could resolve DNS queries through local Unbound
- Pi-hole filtering still worked after switching to Unbound
- clients could resolve DNS using the VIP
- DNS recursion continued to work after failover
- ad blocking continued after failover

---

## 🧠 Lessons Learned

- high availability requires more than just adding a second node
- configuration consistency matters as much as node redundancy
- failover must be tested, not assumed
- each Pi-hole node should use its own local Unbound instance
- the VIP should sit outside the DHCP lease range
- adding Unbound made the DNS layer more complete before moving into monitoring

---

## 🏁 Outcome

Phase 3 successfully transformed the lab from a **single-node DNS deployment** into a **redundant HA DNS platform**.

At the end of this phase, the environment had:

- dual Pi-hole nodes
- synchronized Pi-hole configuration
- VIP-based DNS failover
- local recursive DNS on both nodes
- validated failover and DNS continuity

---

## 🚀 Next Step

With the HA DNS layer complete, the next phase is to build **monitoring and alerting** so the environment can be observed more like a production service.
