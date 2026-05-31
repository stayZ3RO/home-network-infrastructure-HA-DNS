# DNS Recursion with Unbound 🌐

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

This document explains how **Unbound** was added to the HA Pi-hole environment to provide **local recursive DNS resolution** on both nodes.

Instead of forwarding DNS requests to a third-party public resolver, each Pi-hole node now uses its own local Unbound instance.

---

## 🎯 Purpose

The purpose of adding Unbound was to:

- reduce dependency on third-party public upstream DNS providers
- improve control over DNS resolution
- make the HA DNS stack more complete
- preserve node independence during failover

---

## 🧱 Design Decision

Unbound was installed on:

- ashpi-1
- ashpi-2

Each Pi-hole instance was configured to use its **own local Unbound resolver**.

### Local upstream used on each node

```text
127.0.0.1#5335
```

This design was chosen because it avoids introducing a new shared dependency between nodes.

---

## 🧭 DNS Flow with Unbound

```text
Client
  ↓
VIP
  ↓
Active Pi-hole Node
  ↓
Local Unbound Resolver
  ↓
Recursive DNS Resolution
  ↓
Internet
```

During failover:

```text
VIP moves to standby node
  ↓
Standby Pi-hole becomes active
  ↓
Standby node uses its own local Unbound instance
  ↓
DNS recursion continues
```

---

## ✅ What Was Implemented

The following work was completed on both Pi-hole nodes:

- installed Unbound
- created the Unbound configuration used for Pi-hole
- downloaded `root.hints`
- validated configuration with `unbound-checkconf`
- enabled and started the Unbound service
- configured Pi-hole to use `127.0.0.1#5335`
- tested direct recursion on both nodes
- tested recursion through the VIP
- validated recursion after failover

---

## 🧪 Validation Performed

Unbound was validated in multiple ways.

### Direct local recursion test on ashpi-1

```bash
dig google.com @127.0.0.1 -p 5335
```

### Direct local recursion test on ashpi-2

```bash
dig google.com @127.0.0.1 -p 5335
```

### Pi-hole to Unbound path test

```bash
dig google.com @127.0.0.1
dig doubleclick.net @127.0.0.1
```

### VIP path test

```bash
dig google.com @<VIP>
dig doubleclick.net @<VIP>
```

These checks confirmed:

- Unbound was working locally on both nodes
- Pi-hole could forward correctly to local Unbound
- filtering still worked
- recursion continued through the VIP
- recursion continued after failover

---

## 📸 Suggested Screenshots

Useful screenshots for this document include:

- Unbound service status on ashpi-1
- Unbound service status on ashpi-2
- direct `dig` recursion test on ashpi-1
- direct `dig` recursion test on ashpi-2
- Pi-hole DNS upstream set to `127.0.0.1#5335` on ashpi-1
- Pi-hole DNS upstream set to `127.0.0.1#5335` on ashpi-2
- successful DNS resolution through the VIP
- successful recursion after failover

Example image references:

![Unbound ashpi-1 status](../../screenshots/phase-3/20-unbound-active-on-pi1.png)
![Unbound ashpi-2 status](../../screenshots/phase-3/24-pi2-unbound-active.png)
![Unbound ashpi-1 dig test](../../screenshots/phase-3/21-dns-recursion-validation-pi1.png)
![Unbound ashpi-2 dig test](../../screenshots/phase-3/27-pi2-dig-test-after-dns-update.png)

---

## 🧠 Why This Design Matters

Adding Unbound improved the design of the environment in several ways:

- each node can resolve DNS independently
- failover does not depend on one shared upstream resolver
- DNS privacy and control are improved
- the DNS layer is more production-like and self-contained

---

## 🧠 Lessons Learned

- recursive DNS should be treated as part of the core service layer
- each HA node should have its own resolver dependency locally
- testing should include both local node resolution and full VIP-path resolution
- validating failover after adding Unbound is critical

---

## 🏁 Outcome

After Unbound was added and tested, the HA DNS stack included:

- Pi-hole on both nodes
- Gravity Sync replication
- keepalived VIP failover
- local recursive DNS on both nodes
- validated DNS continuity during failover

This completed the core DNS service layer before moving into monitoring and alerting.
