# Phase 5: Validation 🧪

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


## 📖 Purpose

This document captures the validation steps used to confirm that secure remote access works correctly for the homelab.

The validation process focused on:

- successful device enrollment into the tailnet
- successful Raspberry Pi enrollment
- successful tailnet visibility
- SSH service readiness
- secure remote administration without public SSH exposure

---

## Validation 1: Tailnet Creation 🌐

### Validation performed

Confirmed that the Tailscale account and tailnet were available for device enrollment.

### Expected result

The Tailscale admin console should prompt for the first device and then show the Machines view.

### Result

Passed ✅

![Tailscale first device setup](../../screenshots/phase-5/01-tailscale-first-device-setup.png)

![Tailnet before devices were added](../../screenshots/phase-5/02-tailscale-machines-empty-state.png)

---

## Validation 2: Windows Admin Device Enrollment 💻

### Validation performed

Confirmed that the first Windows admin endpoint joined the tailnet.

### Expected result

The Windows desktop should appear in the Tailscale Machines list.

### Result

Passed ✅

![Windows desktop added to tailnet](../../screenshots/phase-5/03-windows-desktop-added-to-tailnet.png)

---

## Validation 3: Second Admin Device Enrollment 🖥️

### Validation performed

Confirmed that a second Windows admin endpoint joined the tailnet.

### Expected result

Both Windows admin devices should appear in the Machines list.

### Result

Passed ✅

![Second Windows admin device added to tailnet](../../screenshots/phase-5/04-second-windows-device-added-to-tailnet.png)

---

## Validation 4: ashpi-1 Tailnet Enrollment 📡

### Validation performed

Installed and authenticated Tailscale on `ashpi-1`.

### Expected result

`ashpi-1` should:

- receive a Tailscale IP address
- appear in `tailscale status`
- appear in the Tailscale admin console
- show the correct hostname

### Result

Passed ✅

![Tailscale installation started on ashpi-1](../../screenshots/phase-5/05-ashpi-1-tailscale-install-started.png)

![ashpi-1 authenticated and visible in Tailscale status](../../screenshots/phase-5/06-ashpi-1-tailscale-authenticated-status.png)

![ashpi-1 visible in Tailscale admin console](../../screenshots/phase-5/07-ashpi-1-visible-in-admin-console.png)

---

## Validation 5: ashpi-2 Tailnet Enrollment 📡

### Validation performed

Installed and authenticated Tailscale on `ashpi-2`.

### Expected result

`ashpi-2` should:

- receive a Tailscale IP address
- appear in `tailscale status`
- appear in the Tailscale admin console
- show the correct hostname

### Result

Passed ✅

![Tailscale installation and authentication on ashpi-2](../../screenshots/phase-5/08-ashpi-2-tailscale-install-authenticated.png)

![ashpi-2 authenticated and visible in Tailscale status](../../screenshots/phase-5/09-ashpi-2-tailscale-status.png)

---

## Validation 6: All Core Devices Visible in Tailnet ✅

### Validation performed

Confirmed that all intended devices appeared in the Tailscale Machines list.

### Expected result

The admin console should show:

- Windows desktop
- second Windows admin device
- `ashpi-1`
- `ashpi-2`

### Result

Passed ✅

![All core devices visible in the tailnet](../../screenshots/phase-5/10-all-core-devices-visible-in-tailnet.png)

---

## Validation 7: Tailscale SSH Enabled 🔐

### Validation performed

Enabled Tailscale SSH on both Raspberry Pi nodes.

### Commands used

```bash
sudo tailscale set --ssh
```

### Expected result

The command should complete successfully on each Pi node.

### Result

Passed ✅

![Tailscale SSH enabled on ashpi-1](../../screenshots/phase-5/11-ashpi-1-tailscale-ssh-enabled.png)

![Tailscale SSH enabled on ashpi-2](../../screenshots/phase-5/12-ashpi-2-tailscale-ssh-enabled.png)

---

## Validation 8: SSH Service Status on Pi Nodes 🧪

### Validation performed

Confirmed that the SSH service was enabled and running on both Pi nodes.

### Command used

```bash
sudo systemctl status ssh
```

### Expected result

The SSH service should show:

- `enabled`
- `active (running)`

### Result

Passed ✅

![SSH service active on ashpi-1](../../screenshots/phase-5/13-ashpi-1-ssh-service-active.png)

![SSH service active on ashpi-2](../../screenshots/phase-5/14-ashpi-2-ssh-service-active.png)

---

## Validation 9: Admin Endpoint Testing Note 📌

### Validation performed

Tested Tailscale commands from the admin endpoint environment.

### Result

Partially useful ✅

The test showed that Ubuntu WSL on the Windows admin machine was not the authenticated Tailscale context.

This clarified that the correct admin path was the Windows Tailscale client rather than a separate unauthenticated WSL Tailscale context.

![Tailscale ping validation from admin device](../../screenshots/phase-5/15-tailscale-ping-validation-from-admin-device.png)

---

## Validation 10: No Public SSH Exposure 🚫

### Validation performed

Confirmed that the remote access design did not require public SSH port forwarding.

### Expected result

Remote administration should work through Tailscale only.

### Result

Passed ✅

The homelab remained remotely manageable without exposing SSH directly to the public internet.

---

## 🏁 Conclusion

Phase 5 validation confirmed that the homelab now has:

- working secure remote access
- Windows admin endpoints joined to the tailnet
- both Raspberry Pi nodes joined to the tailnet
- Tailscale SSH enabled on both Pi nodes
- SSH service active on both Pi nodes
- no need for public SSH exposure or router port forwarding

This completes the secure remote access phase of the project.
