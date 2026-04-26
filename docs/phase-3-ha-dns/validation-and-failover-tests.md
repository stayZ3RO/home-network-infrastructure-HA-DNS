# Phase 3 — Validation and Failover Tests 🧪

## 📖 Purpose

This document captures the validation testing performed during Phase 3.

The goal was to prove that the HA DNS design worked under normal conditions and during failover.

---

## ✅ Validation Areas

The following areas were tested:

- Gravity Sync replication
- keepalived VIP assignment
- VIP failover from primary to secondary
- Unbound recursive DNS on both nodes
- DNS resolution through the VIP
- client DNS resolution after failover
- ad blocking after failover

---

## 1. Gravity Sync Validation 🔄

Gravity Sync was validated to confirm both Pi-hole nodes had matching configuration.

![Gravity Sync compare confirmed](../../screenshots/phase-3/9-gravity-sync-compare-confirmed.png)

### Result

- Pi-hole configuration matched between both nodes
- synchronization completed successfully
- both nodes were ready for HA DNS operation

---

## 2. VIP Ownership Before Failover ⚖️

Before failover testing, the VIP was confirmed on the primary node.

![VIP active on primary node](../../screenshots/phase-3/13-vip-active-on-primary-node.png)

### Result

- VIP was active on the expected primary node
- clients could use the VIP as the DNS target
- keepalived was functioning in the normal state

---

## 3. VIP Failover Test 🔁

Failover was triggered by stopping keepalived on the active node.

![Failover triggered](../../screenshots/phase-3/15-failover-triggered.png)

After failover, the secondary node became active.

![After failover secondary active](../../screenshots/phase-3/16-after-failover-secondary-active.png)

### Result

- VIP moved from the primary node to the secondary node
- failover occurred successfully
- DNS service remained available through the VIP

---

## 4. DNS After Failover 📡

After the VIP moved, DNS was tested from the client side.

![Client DNS test after failover](../../screenshots/phase-3/34-client-dns-test-after-failover.png)

### Result

- client DNS resolution continued to work
- queries were still handled through the VIP
- failover did not break normal DNS resolution

---

## 5. Ad Blocking After Failover 🧱

A blocked domain was tested after failover to confirm Pi-hole filtering still worked.

![Ad block test after failover](../../screenshots/phase-3/35-adblock-test-after-failover.png)

### Result

- blocked domain returned the expected filtered response
- Pi-hole ad blocking continued after failover
- the HA DNS path preserved filtering behavior

---

## 6. Primary Recovery Check ✅

After testing, the original primary node was verified again.

![Verify primary active after failover](../../screenshots/phase-3/18-verify-primary-active-after-failover.png)

### Result

- the original node recovered successfully
- keepalived returned to the expected operating state
- the HA DNS setup was stable after testing

---

## 🏁 Final Result

The HA DNS design passed validation.

Confirmed outcomes:

- the secondary node could take over DNS service
- the VIP moved during failover
- DNS remained available after failover
- client DNS resolution survived failover
- ad blocking survived failover
- the environment recovered cleanly after testing
