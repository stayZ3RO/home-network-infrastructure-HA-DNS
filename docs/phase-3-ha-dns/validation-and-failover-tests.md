# Phase 3 — Validation and Failover Tests 🧪

## 📖 Purpose

This document captures the validation testing performed during Phase 3.

The goal was to prove that the HA DNS design worked under normal conditions and during failover.

---

## ✅ Validation Areas

The following areas were tested:

- secondary Pi-hole node availability
- Gravity Sync replication
- keepalived VIP assignment
- VIP failover from primary to secondary
- Unbound recursive DNS on both nodes
- DNS resolution through the VIP
- client DNS resolution after failover
- ad blocking after failover

---

## 1. Secondary Node Validation 🖥️

The secondary Raspberry Pi was prepared and confirmed online.

![Pi 2 prep](../../screenshots/phase-3/1-pi2-prep.png)

The Pi-hole dashboard initially showed an issue, which was later corrected.

![Pi 2 Pi-hole dashboard error](../../screenshots/phase-3/2-pi2-pihole-dashboard-error.png)

![Pi 2 dashboard domain fix](../../screenshots/phase-3/3-pi2-dashboard-domain-fix.png)

---

## 2. Gravity Sync Validation 🔄

Gravity Sync was validated to confirm both Pi-hole nodes had matching configuration.

![Gravity Sync config complete](../../screenshots/phase-3/7-gravity-sync-config-complete.png)

![Gravity Sync push confirmed](../../screenshots/phase-3/8-gravity-sync-push-confirmed.png)

![Gravity Sync compare confirmed](../../screenshots/phase-3/9-gravity-sync-compare-confirmed.png)

---

## 3. keepalived and VIP Validation ⚖️

The keepalived configuration was validated on both the primary and backup nodes.

![keepalived config primary node](../../screenshots/phase-3/10-keepalived-config-primary-node.png)

![keepalived backup config](../../screenshots/phase-3/11-keepalived-backup-config.png)

The VIP was then confirmed on the primary node.

![VIP assigned primary node](../../screenshots/phase-3/12-vip-assigned-primary-node.png)

![VIP active on primary node](../../screenshots/phase-3/13-vip-active-on-primary-node.png)

---

## 4. Initial Failover Test 🔁

The first failover test confirmed that the VIP could move from the primary node to the secondary node.

![Before failover primary active](../../screenshots/phase-3/14-before-failover-primary-active.png)

![Failover triggered](../../screenshots/phase-3/15-failover-triggered.png)

![After failover secondary active](../../screenshots/phase-3/16-after-failover-secondary-active.png)

DNS remained active after failover.

![DNS active after failover](../../screenshots/phase-3/17-dns-active-after-failover.png)

The primary node was later verified again after recovery.

![Verify primary active after failover](../../screenshots/phase-3/18-verify-primary-active-after-failover.png)

---

## 5. Unbound Validation on ashpi-1 🌐

Unbound was validated on the primary node before and after updating Pi-hole DNS settings.

![Unbound active on pi1](../../screenshots/phase-3/20-unbound-active-on-pi1.png)

![DNS Unbound dig test before Pi-hole DNS update](../../screenshots/phase-3/21-dns-unbound-dig-test-before-pihole-dns-update.png)

![DNS recursion validation pi1](../../screenshots/phase-3/21-dns-recursion-validation-pi1.png)

![Pi 1 Pi-hole DNS](../../screenshots/phase-3/22-pi1-pihole-dns.png)

![Unbound validation pi1](../../screenshots/phase-3/23-unbound-validation-pi1.png)

![DNS dig validation after Pi-hole DNS](../../screenshots/phase-3/23-dns-dig-validation-after-pihole-dns.png)

---

## 6. Unbound Validation on ashpi-2 🌐

Unbound was then validated on the secondary node.

![Pi 2 Unbound active](../../screenshots/phase-3/24-pi2-unbound-active.png)

![Pi 2 DNS dig test before Pi-hole DNS update](../../screenshots/phase-3/25-pi2-dns-dig-test-before-pihole-dns-update.png)

![Pi 2 Pi-hole DNS update](../../screenshots/phase-3/26-pi2-pihole-dns-update.png)

![Pi 2 dig test after DNS update](../../screenshots/phase-3/27-pi2-dig-test-after-dns-update.png)

---

## 7. Configuration Consistency Validation 🔍

After both nodes were updated, configuration consistency was validated.

![Verify config between nodes](../../screenshots/phase-3/28-verify-config-between-nodes.png)

Client-side DNS was also tested.

![Dig test on client](../../screenshots/phase-3/29-dig-test-on-client.png)

---

## 8. Recursive DNS Before Failover 🔎

Recursive DNS behavior was validated before triggering another failover test.

![Before failover Unbound test](../../screenshots/phase-3/30-before-failover-unbound-test.png)

![Before failover Unbound test 2](../../screenshots/phase-3/31-before-failover-unbound-test-2.png)

---

## 9. Recursive DNS After Failover ✅

Failover was triggered again after Unbound was configured on both nodes.

![Verify VIP failover](../../screenshots/phase-3/32-verify-vip-failover.png)

DNS was then tested through the backup node.

![Verify dig after failover backup node](../../screenshots/phase-3/33-verify-dig-after-failover-backup-node.png)

Client DNS continued to work after failover.

![Client DNS test after failover](../../screenshots/phase-3/34-client-dns-test-after-failover.png)

Ad blocking also continued to work after failover.

![Ad block test after failover](../../screenshots/phase-3/35-adblock-test-after-failover.png)

---

## 🏁 Result

The HA DNS design passed validation.

Confirmed outcomes:

- the secondary node could take over DNS service
- the VIP moved during failover
- DNS remained available after failover
- Unbound recursion worked on both nodes
- client DNS resolution survived failover
- ad blocking survived failover
