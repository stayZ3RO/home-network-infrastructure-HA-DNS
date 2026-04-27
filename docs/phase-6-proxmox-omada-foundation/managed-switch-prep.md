# Managed Switch Pre-Staging

## Overview

This document covers the managed switch pre-staging completed before the Phase 7 router and switch cutover.

The goal was to adopt the switch into Omada, assign a static management IP, validate connectivity, and keep all ports on the default flat LAN before introducing VLANs later.

## Target Configuration

| Item | Value |
|---|---|
| Switch Management IP | `192.168.68.2` |
| Subnet Mask | `255.255.255.0` |
| Gateway | `192.168.68.1` |
| DNS | `192.168.68.20` |
| Omada Controller | `192.168.68.10` |
| VLAN State | Default LAN / VLAN 1 only |

## Initial Port Plan

| Port | Planned Use |
|---:|---|
| 1 | Uplink to ER605 LAN |
| 2 | Proxmox Host |
| 3 | ashpi-1 |
| 4 | ashpi-2 |
| 5 | Main Deco AP |
| 6 | Gaming PC |
| 7 | Optional unmanaged switch |
| 8 | Spare / testing |

## Steps Completed

1. Factory reset the managed switch.
2. Connected the switch to the current working LAN.
3. Adopted the switch into Omada Controller.
4. Assigned static management IP `192.168.68.2`.
5. Left all ports on default LAN / VLAN 1.
6. Tested LAN, DNS, and management access through the switch.

## Validation

```powershell
ping 192.168.68.1
ping 192.168.68.2
ping 192.168.68.10
ping 192.168.68.20
ping 192.168.68.80
ping 192.168.68.81
nslookup google.com 192.168.68.20
