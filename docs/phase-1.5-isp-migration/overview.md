# Phase 1.5 — ISP Migration & Edge Control

## Overview

The network environment was migrated from Xfinity (cable) to AT&T Fiber to improve performance and reliability.

This required reconfiguring the network edge while maintaining internal routing, DNS control, and existing infrastructure design.

---

## Objective

* Replace ISP without disrupting internal network
* Maintain Deco as the primary router
* Preserve Pi-hole DNS functionality
* Avoid double NAT
* Integrate fiber via ONT

---

## Architecture Change

### Before (Xfinity)

Internet → Xfinity Gateway (Bridge Mode) → Deco → Pi-hole → Clients

---

### After (AT&T Fiber)

Internet → ONT → AT&T Gateway (IP Passthrough) → Deco → Pi-hole → Clients

## Architecture Change

Before (Xfinity)

Internet → Xfinity Gateway (Bridge Mode) → Deco → Pi-hole → Clients

...

After (AT&T Fiber)

Internet → ONT → AT&T Gateway (IP Passthrough) → Deco → Pi-hole → Clients

...

### Network Diagram

![Architecture](../../diagrams/network-architecture-phase-2.png)

---

## Key Changes

### ISP Replacement

* Migrated from cable to fiber
* Introduced ONT for fiber termination

### IP Passthrough Configuration

![IP Passthrough](../../screenshots/phase-1.5/1-ip-passthrough.png)

---

### Edge Reconfiguration

* Enabled IP Passthrough on AT&T gateway
* Assigned public IP to Deco router

---

### Internal Network Preservation

* Maintained subnet: 192.168.68.x
* Preserved DHCP reservations
* Kept Pi-hole as DNS

---

## Validation

### Public IP Confirmed on Deco

![Deco WAN](../../screenshots/phase-1.5/2-deco-wan-ip.png)

---

### Pi-hole DNS Still Active

![Pi-hole](../../screenshots/phase-1.5/3-pihole-dashboard.png)

* Deco WAN IP confirmed as public
* Pi-hole receiving queries
* DNS resolution functioning correctly
* No connectivity issues

---

## Lessons Learned

* AT&T does not support true bridge mode
* IP Passthrough is required for router control
* Fiber introduces ONT as an additional layer
* Maintaining internal IP structure simplifies migration

---

## Result

* Successfully migrated ISP without breaking architecture
* Improved performance and stability
* Maintained full network control

---

## Next Step

Proceed to Phase 3 to implement high availability DNS.
