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

---

## Key Changes

### ISP Replacement

* Migrated from cable to fiber
* Introduced ONT for fiber termination

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
