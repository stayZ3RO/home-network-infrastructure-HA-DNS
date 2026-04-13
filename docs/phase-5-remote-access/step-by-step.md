# Phase 5 — Step-by-Step Guide 🛠️

## 📖 Purpose

This guide documents the implementation of secure remote access for the homelab using Tailscale.

Phase 5 builds on the completed HA DNS and monitoring stack and adds:

* secure remote connectivity
* private tailnet-based device access
* SSH administration over Tailscale
* off-site validation without router port forwarding

---

## ✅ Prerequisites

Before starting Phase 5, the following were already complete:

* HA DNS with dual Pi-hole nodes
* monitoring and alerting with Prometheus and Grafana
* local SSH access to both Pi nodes on the home network
* gaming PC and laptop available as remote admin endpoints

---

## 1. Create the Tailscale Tailnet 🌐

Tailscale was selected as the Phase 5 remote access platform.

### Tasks completed

1. created or signed in to a Tailscale account
2. allowed Tailscale to create the private tailnet
3. opened the Tailscale admin console

### Validation

* admin console loaded successfully
* tailnet was available for device enrollment

---

## 2. Confirm MagicDNS 🧭

MagicDNS was confirmed so devices could be reached by hostname instead of only by Tailscale IP.

### Validation

* MagicDNS was enabled
* device names could later be used for remote access testing

---

## 3. Add the Gaming PC 💻

The gaming PC was added to the tailnet first.

### Tasks completed

1. installed Tailscale on the gaming PC
2. signed in with the same Tailscale account
3. confirmed the gaming PC appeared in the Machines list

### Validation

* gaming PC successfully joined the tailnet

---

## 4. Add the Laptop 🖥️

The laptop was added as the secondary admin endpoint.

### Tasks completed

1. installed Tailscale on the laptop
2. signed in with the same Tailscale account
3. confirmed the laptop appeared in the Machines list

### Validation

* laptop successfully joined the tailnet

---

## 5. Add ashpi-1 📡

Tailscale was installed on `ashpi-1`.

### Tasks completed

1. SSH’d locally into `ashpi-1`
2. installed Tailscale using the Linux install script
3. authenticated the device using `tailscale up`
4. confirmed the device appeared in the Tailscale admin console

### Validation commands

```bash
tailscale status
tailscale ip -4
hostname
```

### Validation

* `ashpi-1` joined the tailnet successfully

---

## 6. Add ashpi-2 📡

The same Tailscale process was repeated on `ashpi-2`.

### Validation commands

```bash
tailscale status
tailscale ip -4
hostname
```

### Validation

* `ashpi-2` joined the tailnet successfully

---

## 7. Rename Devices Cleanly 🏷️

Devices were renamed in the Tailscale Machines page for clearer administration.

### Device names used

* `gaming-pc`
* `laptop`
* `ashpi-1`
* `ashpi-2`

### Validation

* device list became easier to navigate and validate

---

## 8. Test Tailnet Connectivity ✅

Basic connectivity was tested before moving to SSH.

### Validation commands

From the admin endpoint:

```bash
tailscale ping ashpi-1
tailscale ping ashpi-2
```

### Result

* `tailscale ping` returned successful responses for both Raspberry Pi nodes

---

## 9. Test SSH over Tailscale 🔐

Standard SSH over the Tailscale private path was used for validation.

### Validation commands

```bash
ssh <pi-username>@ashpi-1
ssh <pi-username>@ashpi-2
```

Once connected, the following commands were used to confirm the remote host:

```bash
hostname
ip a
```

### Result

* successful SSH session to `ashpi-1`
* successful SSH session to `ashpi-2`

---

## 10. Validate Off-Site Remote Access 📶

The final validation was performed from outside the home network using a phone hotspot.

### Tasks completed

1. moved the admin endpoint off the home network
2. confirmed Tailscale was still connected
3. SSH’d to both Raspberry Pi nodes again

### Result

* successful remote SSH access to both Pi nodes from outside the home network
* no router SSH port forwarding was required

---

## 11. Notes from Implementation 📝

A small implementation detail surfaced during testing:

* running `tailscale` commands from Ubuntu WSL on the gaming PC showed the WSL environment as a separate Tailscale context
* the clean approach was to run Tailscale tests from the Windows host where the Tailscale client was already authenticated

This avoided unnecessary complexity while preserving the intended Phase 5 design.

---

## 🏁 Result

Phase 5 completed the secure remote access layer for the homelab by adding:

* private tailnet-based connectivity
* direct SSH access to both Pi nodes over Tailscale
* successful off-site validation
* a remote admin path that does not depend on public SSH exposure
