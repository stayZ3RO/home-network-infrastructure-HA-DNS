# Phase 3 — High Availability DNS 🛡️

## 📖 Summary

This phase expands the lab from a single-node Pi-hole deployment into a high-availability DNS platform.

Phase 3 introduced:

- Dual Pi-hole DNS nodes
- Gravity Sync for Pi-hole configuration replication
- keepalived for Virtual IP failover
- Unbound for local recursive DNS resolution
- Failover validation to confirm DNS continuity

---

## 🧱 Architecture

| Component | Role | IP Address |
|---|---|---|
| ashpi-1 | Primary Pi-hole / DNS node | 192.168.68.60 |
| ashpi-2 | Secondary Pi-hole / DNS node | 192.168.68.61 |
| VIP | Shared DNS Virtual IP | 192.168.68.20 |

Clients use the VIP as their DNS resolver. keepalived controls which Pi-hole node owns the VIP.

---

## 📸 Key Result

The screenshot below shows the secondary node active after failover.

![After failover secondary active](../../screenshots/phase-3/16-after-failover-secondary-active.png)

---

## ✅ What Was Completed

- Added a second Raspberry Pi DNS node
- Installed and validated Pi-hole on the secondary node
- Configured SSH trust for node-to-node synchronization
- Configured Gravity Sync between both Pi-hole nodes
- Configured keepalived and a shared DNS VIP
- Validated VIP failover from primary to secondary
- Installed Unbound on both Pi-hole nodes
- Updated both Pi-hole nodes to use local Unbound recursion
- Validated DNS resolution before, during, and after failover
- Confirmed ad blocking continued after failover

---

## 📚 Documentation

- [Overview](./overview.md)
- [Step-by-Step Guide](./step-by-step.md)
- [Jump Box Access](./jump-box-access.md)
- [Validation and Failover Tests](./validation-and-failover-tests.md)
- [Diagrams](./diagrams.md)
