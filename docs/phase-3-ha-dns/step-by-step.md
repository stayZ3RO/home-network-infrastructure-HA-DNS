# Phase 3 — Step-by-Step Guide 🛠️

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

![Secondary Pi added](../../screenshots/phase-3/secondary-pi-added.png)

---

## 2. Install Pi-hole on the Secondary Node 🕳️

Pi-hole was installed on the second Raspberry Pi so both nodes could serve DNS.

### Tasks completed

1. updated the system
2. installed Pi-hole
3. confirmed the admin web UI loaded
4. confirmed local DNS queries succeeded

### Validation

- Pi-hole installed successfully on ashpi-2
- Pi-hole dashboard was reachable
- local queries resolved successfully

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
- both Pi-hole nodes showed matching configuration

![Gravity Sync installed](../../screenshots/phase-3/gravity-sync-installed.png)
![Gravity Sync verified](../../screenshots/phase-3/gravity-sync-verified.png)

---

## 4. Configure keepalived and the VIP ⚖️

keepalived was used to provide a floating virtual IP (VIP) for client DNS.

### Tasks completed

1. installed keepalived on both nodes
2. configured node priority and failover behavior
3. defined the shared VIP
4. started and enabled the service
5. confirmed the VIP was owned by the primary node

### Validation

- VIP appeared on the primary node
- keepalived service was active

![VIP on primary](../../screenshots/phase-3/vip-on-primary.png)

---

## 5. Validate VIP Failover 🔁

Failover was tested to confirm that the secondary node could take over DNS service.

### Tasks completed

1. stopped keepalived on the active node
2. confirmed the VIP moved to the standby node
3. restored keepalived on the original node
4. confirmed normal service returned

### Validation

- VIP transferred successfully to ashpi-2
- failover occurred as expected

![VIP failover to secondary](../../screenshots/phase-3/vip-failover-to-secondary.png)

---

## 6. Install Unbound on ashpi-1 🌐

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
- direct recursive DNS queries succeeded

![Unbound ashpi-1 status](../../screenshots/phase-3/unbound-status-ashpi1.png)
![Unbound ashpi-1 dig test](../../screenshots/phase-3/unbound-dig-ashpi1.png)

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

![Pi-hole upstream ashpi-1](../../screenshots/phase-3/pihole-upstream-unbound-ashpi1.png)

---

## 8. Install Unbound on ashpi-2 🌐

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

![Unbound ashpi-2 status](../../screenshots/phase-3/unbound-status-ashpi2.png)
![Unbound ashpi-2 dig test](../../screenshots/phase-3/unbound-dig-ashpi2.png)

---

## 9. Point ashpi-2 Pi-hole to Local Unbound 🔗

Pi-hole on ashpi-2 was then updated to use its own local Unbound resolver.

### Upstream DNS configured

```text
127.0.0.1#5335
```

### Tasks completed

1. opened the Pi-hole admin interface on ashpi-2
2. navigated to **Settings → DNS**
3. configured `127.0.0.1#5335` as the custom upstream resolver
4. restarted Pi-hole DNS
5. tested normal and blocked domains locally

### Validation

- ashpi-2 successfully used local Unbound
- Pi-hole filtering remained functional

![Pi-hole upstream ashpi-2](../../screenshots/phase-3/pihole-upstream-unbound-ashpi2.png)

---

## 10. Validate DNS Through the VIP 📡

The next step was validating the end-to-end DNS path through the shared VIP.

### Tasks completed

1. queried a normal domain against the VIP
2. queried a blocked domain against the VIP
3. confirmed that responses were correct through the HA DNS path

### Validation

- normal DNS resolution worked through the VIP
- blocked domains remained filtered through the VIP

![VIP DNS test success](../../screenshots/phase-3/vip-dns-test-success.png)

---

## 11. Validate Failover with Recursive DNS 🧪

After Unbound was configured on both nodes, failover testing was repeated.

### Tasks completed

1. forced failover again
2. confirmed the VIP moved to ashpi-2
3. queried DNS through the VIP
4. confirmed recursive DNS still succeeded
5. restored the original state if needed

### Validation

- DNS remained available after failover
- recursion still worked through the standby node
- no new internal single point of failure was introduced

![Failover recursion success](../../screenshots/phase-3/failover-dns-recursion-success.png)

---

## ✅ Final Validation Checklist

- [x] secondary Pi added to the network
- [x] Pi-hole installed on both nodes
- [x] Gravity Sync functioning
- [x] keepalived configured
- [x] VIP failover validated
- [x] Unbound installed on ashpi-1
- [x] Unbound installed on ashpi-2
- [x] Pi-hole on both nodes using local Unbound
- [x] DNS resolution works locally on both nodes
- [x] DNS resolution works through the VIP
- [x] recursive DNS survives failover

---

## 🏁 Result

Phase 3 completed the HA DNS layer by adding:

- dual Pi-hole nodes
- synchronized configuration
- VIP-based failover
- local recursive DNS on both nodes
- validated DNS continuity during failover
