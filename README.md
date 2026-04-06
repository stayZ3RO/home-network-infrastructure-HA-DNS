# Home Network Infrastructure Lab 🚀

### Building a Production-Style Home Network with HA DNS, Monitoring, and Secure Access

---

## 📖 About This Project

This project documents the process of building a **self-managed home network infrastructure lab** from the ground up.

Instead of relying on ISP-managed networking, the goal is to design a system that mirrors **real-world infrastructure environments**, including:

* Custom routing and network control
* High availability DNS architecture
* Observability and monitoring
* Secure remote access

Each phase builds toward a more resilient, observable, and production-like infrastructure environment.

---

## 🧭 Architecture Overview

Internet → ISP Gateway (Bridge Mode) → Deco Mesh Router → Pi-hole DNS → Clients

## 🧱 Current Progress

* ✅ Phase 1 — Network Control
* ✅ Phase 2 — DNS Control (Pi-hole)
* ⬜ Phase 3 — High Availability DNS
* ⬜ Phase 4 — Monitoring & Alerting
* ⬜ Phase 5 — Remote Access

## 📡 Current State

- ISP routing removed (bridge mode enabled)
- Mesh system acting as primary router
- Centralized DNS via Pi-hole
- Network-wide ad blocking active
- DNS query visibility enabled

---

## 📚 Documentation

* [Phase 1 – Network Control Overview](docs/phase-1-network-control/phase-1overview.md)
* [Phase 1 – Step-by-Step Guide](docs/phase-1-netowrk-control/phase-1step-by-step.md)
* [Phase 2 – DNS Control Overview](docs/phase-2-dns-control/phase-2-overview.md)
* [Phase 2 – Step-by-Step Guide](docs/phase-2-dns-control/phase-2-step-by-step.md)

---

## 🖥️ Hardware

* TP-Link X25 Mesh System
* Xfinity Gateway (Bridge Mode)
* D-Link 16-Port Switch
* Desktop (Control Node)
* Laptop (Test Node)
* Raspberry Pi Nodes (Phase 2+)

## 🧠 What This Project Demonstrates

- Network architecture design
- Infrastructure ownership
- High availability concepts
- Observability and monitoring
- Secure remote access design

---

## 🧭 How to Navigate This Project

* Start with the README for an overview
* Review each phase overview to understand design decisions
* Follow the step-by-step guide to replicate the setup
* Use screenshots to validate your own configuration

---

## 📐 Documentation Structure

Each phase in this project follows a consistent documentation pattern:

### 1. Overview Document

Explains:

* What changed
* Why it matters
* Lessons learned

### 2. Step-by-Step Guide

Explains:

* Exact setup process
* Order of operations
* Validation checkpoints

### 3. Screenshots

Shows:

* Proof of implementation
* UI validation
* Before and after states

This structure reflects real-world engineering documentation practices.

---

## 🎯 Goal

To build a home lab that simulates **real-world infrastructure engineering**, covering networking, DNS, monitoring, and secure remote access.

---

## 🚀 Next Step

Phase 2 will introduce Pi-hole for DNS control and network-wide filtering.
