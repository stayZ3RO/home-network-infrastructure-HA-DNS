# Phase 5 — Remote Access Overview 🔐

---

## Quick Navigation

| Page | Link |
|---|---|
| Phase Home | [README](README.md) |
| Overview | [overview.md](overview.md) |
| Step-by-Step Guide | [step-by-step.md](step-by-step.md) |
| Validation | [validation.md](validation.md) |
| Documentation Hub | [docs/](../README.md) |

---


## 📖 Overview

Phase 5 adds the **secure remote administration layer** to the homelab.

By the end of Phase 4, the environment already had:

- HA DNS with dual Pi-hole nodes
- Gravity Sync replication
- keepalived VIP failover
- Unbound recursive DNS on both nodes
- monitoring and alerting with Prometheus, Grafana, Alertmanager, and Blackbox Exporter
- Discord alert delivery through Alertmanager
- validated failover and alert lifecycle behavior

Phase 5 builds on that by creating a **private remote admin path** into the environment without exposing SSH directly to the internet.

---

## 🎯 Objectives

The goals of this phase were to:

- establish secure remote access to both Raspberry Pi nodes
- add admin endpoints to the tailnet
- avoid public SSH exposure
- avoid router port forwarding
- validate remote administration from outside the home network
- keep the implementation simple and reliable

---

## 🧱 Remote Access Design

Tailscale was used as the secure remote access platform for this phase.

The remote access path became:

```text
Admin Device
  ↓
Tailscale Tailnet
  ↓
ashpi-1 / ashpi-2
```

This created a private remote path that did not require exposing SSH directly to the public internet.

---

## 🖥️ Devices Joined to the Tailnet

The following devices were added to the tailnet:

- Windows desktop / gaming PC
- Windows laptop / admin device
- `ashpi-1`
- `ashpi-2`

MagicDNS naming was used so the Raspberry Pi devices could be reached by clean hostnames.

![All core devices visible in the tailnet](../../screenshots/phase-5/10-all-core-devices-visible-in-tailnet.png)

---

## 🔐 Why Tailscale Was Chosen

Tailscale was chosen for Phase 5 because it provided:

- a fast secure remote access implementation
- free personal use support
- private tailnet connectivity
- MagicDNS-based device naming
- easy validation from both local and off-site networks
- no need for public SSH exposure

For this phase, SSH over the Tailscale private path was used rather than adding more complex routing or access patterns immediately.

---

## 🛡️ Security Approach

The key security decisions for this phase were:

- no public SSH exposure
- no router port forwarding
- remote administration restricted to devices inside the tailnet
- direct SSH access only through the Tailscale private path
- SSH service verified on both Pi nodes
- Tailscale SSH enabled on both Pi nodes for future controlled access

![SSH service active on ashpi-1](../../screenshots/phase-5/13-ashpi-1-ssh-service-active.png)

![SSH service active on ashpi-2](../../screenshots/phase-5/14-ashpi-2-ssh-service-active.png)

---

## ✅ Validation Summary

Phase 5 was validated by confirming:

- the Windows desktop joined the tailnet successfully
- the second Windows admin device joined the tailnet successfully
- `ashpi-1` joined the tailnet successfully
- `ashpi-2` joined the tailnet successfully
- both Pi nodes appeared in `tailscale status`
- both Pi nodes appeared in the Tailscale admin console
- SSH was active and running on both Pi nodes
- Tailscale SSH was enabled on both Pi nodes
- no public SSH port forwarding was needed

![ashpi-1 authenticated and visible in Tailscale status](../../screenshots/phase-5/06-ashpi-1-tailscale-authenticated-status.png)

![ashpi-2 authenticated and visible in Tailscale status](../../screenshots/phase-5/09-ashpi-2-tailscale-status.png)

---

## 🏁 Outcome

Phase 5 completed the secure remote admin layer of the project.

At the end of this phase, the homelab had:

- secure private remote administration
- Tailscale connectivity to both Raspberry Pi nodes
- both Pi nodes visible in the Tailscale admin console
- SSH service validated on both Pi nodes
- no reliance on public SSH exposure
- a cleaner and safer operational model for remote management

---

## 🚀 Next Step

With the first five phases complete, the next major area of growth is:

- managed switching
- VLANs and segmentation
- stronger network separation
- migration of monitoring to a dedicated always-on host
- deeper infrastructure services on future workstation / Proxmox hardware
