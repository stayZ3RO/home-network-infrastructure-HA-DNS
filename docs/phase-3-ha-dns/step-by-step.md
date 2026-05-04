# Phase 3 — Step-by-Step Guide 🛠️

---

## Quick Navigation

| Page | Link |
|---|---|
| Phase Home | [README](README.md) |
| Overview | [overview.md](overview.md) |
| Step-by-Step Guide | [step-by-step.md](step-by-step.md) |
| Jump Box Access | [jump-box-access.md](jump-box-access.md) |
| Validation and Failover Tests | [validation-failover-tests.md](validation-failover-tests.md) |
| Diagrams | [diagrams.md](diagrams.md) |
| DNS Recursion with Unbound | [DNS-recursion-unbound.md](DNS-recursion-unbound.md) |
| Documentation Hub | [docs/](../README.md) |

---


## 📖 Purpose

This guide documents the implementation of the **high-availability DNS layer** for the home network lab.

Phase 3 builds on the single-node Pi-hole deployment from Phase 2 and adds:

- a secondary Pi-hole node
- Gravity Sync replication
- keepalived failover with a VIP
- Unbound recursive DNS on both nodes

---

## ✅ Prerequisites

Before starting Phase 3, the following were already complete:

- AT&T Fiber migration with IP Passthrough
- Deco mesh router acting as the primary router
- a working primary Pi-hole node
- DHCP configured to hand out Pi-hole as DNS
- SSH access to the Raspberry Pi nodes

---

## 1. Add the Secondary Raspberry Pi 🖥️

The first step was adding a second Raspberry Pi to the network so DNS would no longer depend on a single node.

### Tasks completed

1. connected the second Raspberry Pi to power and Ethernet
2. confirmed it appeared on the network
3. assigned or reserved a static IP
4. verified SSH access

### Validation

- secondary Pi was visible on the network
- SSH access worked correctly
- Pi-hole dashboard was reachable after setup

![Pi 2 prep](../../screenshots/phase-3/1-pi2-prep.png)

![Pi 2 Pi-hole dashboard error](../../screenshots/phase-3/2-pi2-pihole-dashboard-error.png)

![Pi 2 dashboard domain fix](../../screenshots/phase-3/3-pi2-dashboard-domain-fix.png)

---

## 2. Configure SSH Trust for Node Synchronization 🔑

Before Gravity Sync could replicate configuration between the nodes, SSH trust had to be configured.

### Tasks completed

1. generated an SSH key
2. copied the key to the secondary Pi-hole node
3. verified passwordless SSH access
4. confirmed the nodes could communicate securely

### Validation

- SSH key was generated
- key was copied to ashpi-2
- passwordless SSH worked successfully

![Keygen for Pi sync](../../screenshots/phase-3/4-keygen-for-pi-sync.png)

![Copy key to pi2](../../screenshots/phase-3/5-copy-key-to-pi2.png)

![SSH no password confirmation](../../screenshots/phase-3/6-ssh-nopassword-confirmation.png)

---

## 3. Configure Gravity Sync 🔄

Gravity Sync was added so both Pi-hole nodes would stay aligned.

### Tasks completed

1. installed Gravity Sync
2. configured trust between both nodes
3. defined the primary and secondary roles
4. performed the initial sync
5. validated that replication completed successfully

### Validation

- sync completed successfully
- push completed successfully
- configuration comparison confirmed both nodes matched

![Gravity Sync config complete](../../screenshots/phase-3/7-gravity-sync-config-complete.png)

![Gravity Sync push confirmed](../../screenshots/phase-3/8-gravity-sync-push-confirmed.png)

![Gravity Sync compare confirmed](../../screenshots/phase-3/9-gravity-sync-compare-confirmed.png)

---

## 4. Configure keepalived and the VIP ⚖️

keepalived was used to provide a floating Virtual IP for client DNS.

### Tasks completed

1. installed keepalived on both nodes
2. configured the primary node
3. configured the backup node
4. defined the shared VIP
5. started and enabled the keepalived service
6. confirmed the VIP was owned by the primary node

### Validation

- keepalived configuration was present on the primary node
- backup node configuration was present
- VIP was assigned successfully
- VIP was active on the primary node

![keepalived config primary node](../../screenshots/phase-3/10-keepalived-config-primary-node.png)

![keepalived backup config](../../screenshots/phase-3/11-keepalived-backup-config.png)

![VIP assigned primary node](../../screenshots/phase-3/12-vip-assigned-primary-node.png)

![VIP active on primary node](../../screenshots/phase-3/13-vip-active-on-primary-node.png)

---

## 5. Validate VIP Failover 🔁

Failover was tested to confirm that the secondary node could take over DNS service.

### Tasks completed

1. confirmed the primary node owned the VIP
2. stopped keepalived on the active node
3. confirmed the VIP moved to the standby node
4. confirmed DNS stayed active after failover
5. restored keepalived on the original node
6. confirmed normal service returned

### Validation

- VIP transferred successfully to ashpi-2
- DNS remained active after failover
- primary node could become active again after recovery

![Before failover primary active](../../screenshots/phase-3/14-before-failover-primary-active.png)

![Failover triggered](../../screenshots/phase-3/15-failover-triggered.png)

![After failover secondary active](../../screenshots/phase-3/16-after-failover-secondary-active.png)

![DNS active after failover](../../screenshots/phase-3/17-dns-active-after-failover.png)

![Verify primary active after failover](../../screenshots/phase-3/18-verify-primary-active-after-failover.png)

---

## 6. Install and Validate Unbound on ashpi-1 🌐

Unbound was installed on the primary Pi-hole node to provide local recursive DNS resolution.

### Tasks completed

1. installed `unbound`
2. created the Pi-hole Unbound configuration
3. downloaded `root.hints`
4. validated the configuration with `unbound-checkconf`
5. started and enabled the service
6. tested direct recursion with `dig @127.0.0.1 -p 5335`

### Validation

- Unbound service was running
- direct recursive DNS queries succeeded before updating Pi-hole DNS settings
- Pi-hole was updated to use local Unbound
- DNS queries succeeded after the DNS update

![Unbound active on pi1](../../screenshots/phase-3/20-unbound-active-on-pi1.png)

![DNS Unbound dig test before Pi-hole DNS update](../../screenshots/phase-3/21-dns-unbound-dig-test-before-pihole-dns-update.png)

![DNS recursion validation pi1](../../screenshots/phase-3/21-dns-recursion-validation-pi1.png)

![Pi 1 Pi-hole DNS](../../screenshots/phase-3/22-pi1-pihole-dns.png)

![Unbound validation pi1](../../screenshots/phase-3/23-unbound-validation-pi1.png)

![DNS dig validation after Pi-hole DNS](../../screenshots/phase-3/23-dns-dig-validation-after-pihole-dns.png)

---

## 7. Point ashpi-1 Pi-hole to Local Unbound 🔗

Pi-hole on ashpi-1 was updated to use the local Unbound resolver.

### Upstream DNS configured

```text
127.0.0.1#5335
```

### Tasks completed

1. opened the Pi-hole admin interface on ashpi-1
2. navigated to **Settings → DNS**
3. disabled public upstream resolvers as needed
4. added `127.0.0.1#5335` as the custom upstream resolver
5. restarted Pi-hole DNS
6. tested both normal and blocked DNS queries

### Validation

- normal domains resolved correctly
- blocked domains remained filtered
- ashpi-1 successfully used local Unbound

![Pi 1 Pi-hole DNS](../../screenshots/phase-3/22-pi1-pihole-dns.png)

![DNS dig validation after Pi-hole DNS](../../screenshots/phase-3/23-dns-dig-validation-after-pihole-dns.png)

---

## 8. Install and Validate Unbound on ashpi-2 🌐

The same Unbound configuration process was repeated on the secondary node.

### Tasks completed

1. installed `unbound`
2. created the same Unbound configuration
3. downloaded `root.hints`
4. validated the config
5. started and enabled Unbound
6. tested direct recursion locally

### Validation

- Unbound service was running on ashpi-2
- direct recursive DNS queries succeeded
- Pi-hole DNS settings were updated on ashpi-2
- DNS queries succeeded after the DNS update

![Pi 2 Unbound active](../../screenshots/phase-3/24-pi2-unbound-active.png)

![Pi 2 DNS dig test before Pi-hole DNS update](../../screenshots/phase-3/25-pi2-dns-dig-test-before-pihole-dns-update.png)

![Pi 2 Pi-hole DNS update](../../screenshots/phase-3/26-pi2-pihole-dns-update.png)

![Pi 2 dig test after DNS update](../../screenshots/phase-3/27-pi2-dig-test-after-dns-update.png)

---

## 9. Confirm Configuration Consistency Between Nodes 🔄

After both nodes were updated, the configuration was checked again to confirm both Pi-hole nodes stayed aligned.

### Tasks completed

1. compared Pi-hole configuration between nodes
2. validated Gravity Sync output
3. confirmed both nodes were using local Unbound
4. confirmed DNS behavior matched across both nodes

### Validation

- both nodes had matching Pi-hole configuration
- both nodes used Unbound locally
- client DNS queries continued to work

![Verify config between nodes](../../screenshots/phase-3/28-verify-config-between-nodes.png)

![Dig test on client](../../screenshots/phase-3/29-dig-test-on-client.png)

---

## 10. Validate DNS Through the VIP 📡

The next step was validating the end-to-end DNS path through the shared VIP.

### Tasks completed

1. queried a normal domain against the VIP
2. queried a blocked domain against the VIP
3. confirmed that responses were correct through the HA DNS path
4. confirmed DNS worked from a client device

### Validation

- normal DNS resolution worked through the VIP
- blocked domains remained filtered through the VIP
- client DNS traffic used the HA DNS path

![Before failover Unbound test](../../screenshots/phase-3/30-before-failover-unbound-test.png)

![Before failover Unbound test 2](../../screenshots/phase-3/31-before-failover-unbound-test-2.png)

![Dig test on client](../../screenshots/phase-3/29-dig-test-on-client.png)

---

## 11. Validate Failover with Recursive DNS 🧪

After Unbound was configured on both nodes, failover testing was repeated.

### Tasks completed

1. forced failover again
2. confirmed the VIP moved to ashpi-2
3. queried DNS through the VIP
4. confirmed recursive DNS still succeeded
5. confirmed client DNS still worked
6. confirmed ad blocking still worked
7. restored the original state if needed

### Validation

- DNS remained available after failover
- recursion still worked through the standby node
- client DNS still resolved successfully
- ad blocking remained functional
- no new internal single point of failure was introduced

![Verify VIP failover](../../screenshots/phase-3/32-verify-vip-failover.png)

![Verify dig after failover backup node](../../screenshots/phase-3/33-verify-dig-after-failover-backup-node.png)

![Client DNS test after failover](../../screenshots/phase-3/34-client-dns-test-after-failover.png)

![Ad block test after failover](../../screenshots/phase-3/35-adblock-test-after-failover.png)

---

## ✅ Final Validation Checklist

- [x] secondary Pi added to the network
- [x] Pi-hole installed on both nodes
- [x] passwordless SSH configured between nodes
- [x] Gravity Sync functioning
- [x] keepalived configured
- [x] VIP failover validated
- [x] Unbound installed on ashpi-1
- [x] Unbound installed on ashpi-2
- [x] Pi-hole on both nodes using local Unbound
- [x] DNS resolution works locally on both nodes
- [x] DNS resolution works through the VIP
- [x] recursive DNS survives failover
- [x] ad blocking survives failover

---

## 🏁 Result

Phase 3 completed the HA DNS layer by adding:

- dual Pi-hole nodes
- synchronized configuration
- VIP-based failover
- local recursive DNS on both nodes
- validated DNS continuity during failover
