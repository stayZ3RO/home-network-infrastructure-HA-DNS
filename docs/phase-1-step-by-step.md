# Phase 1 – Step-by-Step Guide

## Quick Summary

1. Set up Deco mesh in router mode
2. Verify mesh stability
3. Enable bridge mode on Xfinity
4. Disable ISP WiFi if still active
5. Connect switch and wired devices
6. Reserve IPs for future infrastructure

## Goal

Take control of the home network by moving routing and WiFi responsibility away from ISP-managed hardware and onto the TP-Link mesh system.

---

## Hardware Used

- Xfinity Gateway
- TP-Link X25 Mesh System
- D-Link 16-Port Switch
- Desktop
- Laptop
- Phone with Deco app

---

## Before You Start

Make sure you have:

- the Xfinity gateway powered on
- the TP-Link Deco app installed on your phone
- at least one Ethernet cable ready
- your mesh nodes available
- your desktop and laptop available for testing

---

## Step 1 – Set Up the Mesh Network First

Do not enable bridge mode yet.

1. Connect the main Deco node to the Xfinity gateway with Ethernet.
2. Power on the Deco node.
3. Open the Deco app.
4. Set up the mesh system in **Router Mode**.
5. Create your main WiFi network.
6. Add the remaining mesh nodes.

### Verify
- Phone connects to Deco WiFi
- Laptop connects to Deco WiFi
- Internet works normally

---

## Step 2 – Confirm the Mesh Is Stable

Before changing the gateway, verify:

- WiFi coverage is working
- Devices can browse normally
- The Deco app shows the network as online

---

## Step 3 – Enable Bridge Mode on the Xfinity Gateway

1. Open the gateway admin page.
2. Enable bridge mode.
3. Allow the gateway to reboot if needed.

### Verify
- Deco receives the WAN connection
- The Deco becomes the active router
- Internet access remains available

---

## Step 4 – Disable ISP WiFi If Still Broadcasting

In some cases, Xfinity WiFi can continue broadcasting even after bridge mode is enabled.

If that happens:

1. Go to the gateway WiFi settings
2. Disable 2.4 GHz WiFi
3. Disable 5 GHz WiFi

### Verify
- The old Xfinity SSID is gone
- Only the Deco WiFi remains visible

---

## Step 5 – Confirm Routing Is Clean

On your desktop, check that the Deco is now the router.

### Verify
- Default gateway should be the Deco router IP
- Internet traffic should now flow through Deco only
- Double NAT should be eliminated

---

## Step 6 – Connect the Switch

1. Connect the D-Link switch to the main Deco node
2. Connect the desktop to the switch
3. Connect future wired devices to the switch as needed

### Verify
- Desktop gets network access over Ethernet
- Internet works on wired connection

---

## Step 7 – Prepare for Future Infrastructure

Reserve IP addresses for critical devices in the Deco app.

Suggested reservations:

- Pi-hole primary: `192.168.1.10`
- Pi-hole secondary: `192.168.1.11`
- Future HA VIP: `192.168.1.20`
- Desktop: `192.168.1.50`

---

## Step 8 – Final Validation Checklist

Before moving to Phase 2, confirm all of the following:

- Deco is in Router Mode
- Xfinity gateway is in Bridge Mode
- Xfinity WiFi is disabled
- Only Deco WiFi is active
- Desktop can connect by Ethernet
- Internet is stable
- IP reservation plan is ready

---

## Result

At the end of Phase 1:

- ISP routing is removed from the internal network path
- Deco is the primary router and WiFi system
- The network is cleaner, more stable, and ready for DNS control

---

## Next Step

Proceed to Phase 2: Pi-hole deployment and DNS control.
