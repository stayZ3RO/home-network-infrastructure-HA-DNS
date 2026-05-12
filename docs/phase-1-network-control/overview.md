# Phase 1 Overview — Network Control 🧱

## Introduction

Most home networks start with the ISP gateway controlling routing, Wi-Fi, DHCP, and most of the edge behavior.

That setup is convenient, but it limits visibility and makes it harder to build a reliable lab environment. Phase 1 focused on creating a cleaner baseline by moving the active routing layer to the Deco mesh system.

---

## Objectives

- Move routing control away from the ISP gateway
- Reduce double NAT risk
- Disable unnecessary ISP Wi-Fi broadcasts
- Establish a clean physical and logical network baseline
- Prepare the network for Pi-hole DNS control

---

## Hardware Used

| Device | Role |
|---|---|
| Xfinity Gateway | ISP edge device |
| TP-Link Deco X25 Mesh | Primary routing and Wi-Fi layer |
| D-Link 16-Port Switch | Wired expansion |
| Desktop / Laptop / Phone | Test clients |

---

## Network Before

```text
Internet → Xfinity Gateway → Devices
```

Limitations:

- ISP gateway controlled routing
- Limited lab visibility
- Duplicate Wi-Fi could create confusion
- Not ideal for DNS, monitoring, or HA services

---

## Network After

```text
Internet → Xfinity Gateway in Bridge Mode → Deco Mesh Router → Switch / Clients
```

Improvements:

- Deco became the primary router
- ISP routing was reduced
- Wi-Fi was centralized around the Deco mesh
- Wired expansion was prepared through the switch
- The network was ready for DNS control

---

## Key Changes

| Change | Result |
|---|---|
| Deco deployed in router mode | Established self-managed routing |
| Xfinity bridge mode enabled | Reduced ISP routing overlap |
| ISP Wi-Fi disabled | Removed duplicate SSIDs |
| Switch added | Prepared wired infrastructure |
| IP plan started | Prepared for Pi-hole and HA DNS |

---

## Lessons Learned

- Bridge mode does not always disable ISP Wi-Fi automatically.
- It is safer to validate the replacement network before disabling the old path.
- A clean baseline makes every later phase easier to troubleshoot.

---

## Result

Phase 1 created the starting point for the rest of the infrastructure lab.
