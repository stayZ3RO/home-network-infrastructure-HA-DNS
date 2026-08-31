# Phase 1.5 Overview: ISP Migration 🌐

## Introduction

This phase migrated the upstream internet connection from Xfinity to AT&T Fiber.

The purpose was not only to improve the internet connection, but to document how the network edge changes when moving from cable internet with bridge mode to fiber internet with an ONT and IP Passthrough.

---

## Objectives

- Replace Xfinity with AT&T Fiber
- Integrate the ONT into the topology
- Configure AT&T IP Passthrough
- Keep Deco as the active internal router
- Preserve the existing LAN design
- Validate DNS and client connectivity after migration

---

## Architecture Change

### Before

```text
Internet → Xfinity Gateway in Bridge Mode → Deco Router → Clients
```

### After

```text
Internet → ONT → AT&T Gateway with IP Passthrough → Deco Router → Clients
```

---

## Key Changes

| Change | Result |
|---|---|
| Fiber installed | ONT became part of the physical path |
| AT&T gateway added | ISP edge behavior changed |
| IP Passthrough configured | Deco remained the internal router |
| Existing subnet preserved | Reduced client and service disruption |
| Pi-hole DNS preserved | DNS control remained intact |

---

## Validation

Validation focused on confirming that the ISP changed without breaking the internal network.

Checks performed:

- Deco received the upstream connection
- Internet access worked from clients
- Pi-hole dashboard remained reachable
- DNS queries continued to flow
- Internal addressing stayed consistent

---

## Lessons Learned

- AT&T IP Passthrough is not the same as true bridge mode.
- The ONT should be represented in physical diagrams.
- Preserving the internal IP plan reduces migration risk.
- ISP behavior affects troubleshooting, NAT, and routing assumptions.

---

## Result

The network successfully moved to AT&T Fiber while keeping the internal architecture stable.
