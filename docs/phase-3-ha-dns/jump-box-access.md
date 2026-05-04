# Jump Box Access 🔐

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


## 📖 Overview

This document explains how administrative SSH access was structured for the HA DNS environment.

The goal of this approach was to improve administrative consistency and reduce the need to manually manage access to each DNS node from every device.

---

## 🎯 Purpose

The jump box and SSH trust workflow provides:

- a cleaner SSH administration path
- a central point for managing access to internal nodes
- more consistent operational access to both Pi-hole nodes
- support for repeatable synchronization and maintenance tasks
- a structure that better reflects real-world infrastructure administration

---

## 🧱 Role in the HA DNS Environment

In this project, the access workflow supports administration of:

- ashpi-1
- ashpi-2
- Gravity Sync replication
- keepalived validation
- Unbound validation
- internal DNS troubleshooting

Rather than treating each node as a separate manual access target, this workflow creates a cleaner admin model for managing the HA DNS layer.

---

## 🧭 Access Flow

```text
Admin Device
  ↓
SSH Access
  ↓
Primary Admin Node / Jump Path
  ↓
Internal Pi-hole Nodes
  ├── ashpi-1
  └── ashpi-2
```

---

## ✅ What Was Implemented

The access workflow included:

- generating an SSH key for node-to-node access
- copying the SSH key to the secondary Pi-hole node
- validating passwordless SSH access
- confirming that administrative commands could be run without repeated password prompts
- supporting Gravity Sync replication between Pi-hole nodes

---

## 🔑 Why This Matters

Using a cleaner SSH workflow improves the structure of the project because it:

- centralizes administration
- keeps SSH workflows more consistent
- supports repeatable maintenance tasks
- allows Gravity Sync to replicate configuration reliably
- fits naturally with future remote access hardening
- prepares the lab for later segmentation and admin network design

---

## 🛠️ Administrative Workflow

A typical workflow looks like this:

1. SSH into the administration system
2. verify connectivity to the target Pi
3. SSH into the desired node
4. perform maintenance, validation, or troubleshooting
5. exit back through the same path

---

## 🧪 Validation

Administrative access was considered successful after confirming:

- SSH key generation completed
- SSH key was copied to ashpi-2
- passwordless SSH worked successfully
- Gravity Sync could communicate between nodes
- administrative commands could be run successfully

---

## 📸 Validation Screenshots

The screenshots below confirm the SSH trust workflow used during Phase 3.

![Keygen for Pi sync](../../screenshots/phase-3/4-keygen-for-pi-sync.png)

![Copy key to pi2](../../screenshots/phase-3/5-copy-key-to-pi2.png)

![SSH no password confirmation](../../screenshots/phase-3/6-ssh-nopassword-confirmation.png)

---

## 🧠 Lessons Learned

- centralizing administration makes node management cleaner
- SSH key-based authentication simplifies repeatable workflows
- Gravity Sync depends on reliable SSH trust between nodes
- access design should be treated as part of infrastructure design, not just convenience
- this model lays a good foundation for later remote access hardening

---

## 🚀 Next Step

This access workflow supports the HA DNS layer now and will fit naturally into later remote access and segmentation phases.
