# Phase 3 — High Availability DNS

## 📖 Summary

This phase introduces redundancy and failover to the DNS layer using:

- Dual Pi-hole nodes
- Gravity Sync (config replication)
- Keepalived (Virtual IP failover)

---

## 🧱 Architecture

- ashpi-1 → 192.168.68.60 (Primary)
- ashpi-2 → 192.168.68.61 (Secondary)
- VIP → 192.168.68.20

---

## 📸 Key Result

![Failover](../../screenshots/phase-3/step-16-after-failover-secondary.png)

---

## 📚 Documentation

- [Overview](./phase-3-overview.md)
- [Step-by-Step](./phase-3-step-by-step.md)
- [Jumpbox Access](./jump-box-access.md)
- [Validation](./validation-and-failover-tests.md)
- [Diagrams](./diagrams.md)
