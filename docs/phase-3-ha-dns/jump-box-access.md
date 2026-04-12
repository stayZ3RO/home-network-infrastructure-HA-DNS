# Jumpbox Access

## Overview

In this setup, `ashpi-1` serves as the primary administrative node and can be used as a jumpbox to access internal infrastructure such as `ashpi-2`.

This mirrors a real-world pattern where one trusted internal system is used to reach other internal nodes securely.

---

## Why This Matters

Using a jumpbox helps:

* centralize administrative access
* reduce the need to expose every internal node directly
* simplify secure access workflows
* support automation between internal nodes

---

## Node Reference

* `ashpi-1` → `192.168.68.60`
* `ashpi-2` → `192.168.68.61`

---

## Access Flow

```text
Local Machine → ashpi-1 → ashpi-2
```

---

## Step 1 — SSH into ashpi-1

From your workstation:

```bash
ssh pi@192.168.68.60
```

This connects you to the primary node.

---

## Step 2 — SSH from ashpi-1 into ashpi-2

From within `ashpi-1`:

```bash
ssh pi@192.168.68.61
```

With passwordless SSH configured, this should work without prompting for a password.

---

## Why Passwordless SSH Was Needed

Passwordless SSH enables:

* Gravity Sync automation
* easier internal administration
* jumpbox-style access between infrastructure nodes

---

## Screenshots

### SSH Key Generation

![SSH Key Generation](../../screenshots/phase-3/step-04-keygen.png)

### Copy SSH Key to ashpi-2

![Copy SSH Key](../../screenshots/phase-3/step-05-copy-key.png)

### Passwordless SSH Validation

![Passwordless SSH](../../screenshots/phase-3/step-06-passwordless-ssh.png)

---

## Result

At the end of this setup:

* `ashpi-1` can securely access `ashpi-2`
* passwordless SSH is available for automation
* the environment supports a jumpbox-style administration workflow
