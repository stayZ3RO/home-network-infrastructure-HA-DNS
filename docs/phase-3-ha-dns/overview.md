# Phase 3 Overview: High Availability DNS

## Objective

Eliminate DNS as a single point of failure by introducing redundancy and failover.

---

## Architecture

### ashpi-1
- Pi-hole (Primary)
- keepalived (MASTER)
- gravity-sync (source)
- Jump box (SSH entry point)

### ashpi-2
- Pi-hole (Secondary)
- keepalived (BACKUP)
- gravity-sync (replica)

---

## Key Concepts

### High Availability
Ensures DNS remains operational if one node fails.

### Virtual IP (VIP)
A shared IP address that moves between nodes during failover.

### Synchronization
gravity-sync keeps both Pi-hole nodes identical.

### Jump Box
Centralized SSH access point (ashpi-1).

---

## Traffic Flow

Client → VIP → Active Node

---

## Admin Flow

Main Computer → ashpi-1 → ashpi-2

---

## Before Phase 3

- Single Pi-hole
- DNS outage risk

## After Phase 3

- Dual Pi-hole nodes
- Automatic failover
- Zero DNS downtime

## 🔁 Failover Concept

Clients send DNS queries to a Virtual IP (VIP).  
The VIP always points to the active Pi-hole node.

---

## 📸 Primary Active

![Primary](../../screenshots/phase-3/step-12-vip-assigned-primary.png)

---

## 📸 After Failover

![Secondary](../../screenshots/phase-3/step-16-after-failover-secondary.png)

## Benefits

- Redundancy
- No manual failover required
- Consistent DNS filtering
- Cleaner access pattern
