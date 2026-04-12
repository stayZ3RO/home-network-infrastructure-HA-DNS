# Jump Box Access 🔐

## 📖 Overview

This document explains how administrative SSH access was structured for the HA DNS environment using a **jump box model**.

The goal of this approach was to improve administrative consistency and reduce the need to manage access to each DNS node separately from every device.

---

## 🎯 Purpose

The jump box workflow provides:

- a cleaner SSH administration path
- a central point for managing access to internal nodes
- more consistent operational access to both Pi-hole nodes
- a structure that better reflects real-world infrastructure administration

---

## 🧱 Role in the HA DNS Environment

In this project, the jump box acts as the controlled entry point for accessing:

- ashpi-1
- ashpi-2
- internal lab services as needed

Rather than treating each node as a separate manual access target, the jump box creates a cleaner admin workflow.

---

## 🧭 Access Flow

```text
Admin Device
  ↓
SSH to Jump Box
  ↓
SSH to Internal Pi-hole Nodes
  ├── ashpi-1
  └── ashpi-2
```

---

## ✅ What Was Implemented

The jump box workflow included:

- configuring SSH access to a designated administration host
- validating connectivity from the jump box to internal Pi-hole nodes
- confirming access to ashpi-1
- confirming access to ashpi-2
- using the jump box as a stable admin path for HA DNS work

---

## 🔑 Why This Matters

Using a jump box improves the structure of the project because it:

- centralizes administration
- keeps SSH workflows more consistent
- supports repeatable maintenance tasks
- fits naturally with future remote access hardening
- prepares the lab for later segmentation and admin network design

---

## 🛠️ Administrative Workflow

A typical workflow looks like this:

1. SSH into the jump box
2. verify connectivity to the target Pi
3. SSH from the jump box into the desired node
4. perform maintenance, validation, or troubleshooting
5. exit back through the same path

---

## 🧪 Validation

Administrative access was considered successful after confirming:

- the jump box was reachable
- ashpi-1 was reachable from the jump box
- ashpi-2 was reachable from the jump box
- administrative commands could be run successfully on both nodes

---

## 📸 Suggested Screenshots

Add screenshots that prove the workflow clearly:

- SSH session into the jump box
- SSH from jump box to ashpi-1
- SSH from jump box to ashpi-2
- `hostname` output confirming the correct target node
- successful command execution from the jump box path

Example image references:

![Jump box access](../../screenshots/phase-3/jump-box-access.png)
![Jump box to ashpi-1](../../screenshots/phase-3/jump-box-to-ashpi1.png)
![Jump box to ashpi-2](../../screenshots/phase-3/jump-box-to-ashpi2.png)

---

## 🧠 Lessons Learned

- centralizing administration makes node management cleaner
- a jump box simplifies repeatable SSH workflows
- access design should be treated as part of infrastructure design, not just convenience
- this model lays a good foundation for later remote access hardening

---

## 🚀 Next Step

The jump box workflow provides a clean administrative path now and will fit naturally into the later **remote access** phase of the project.
