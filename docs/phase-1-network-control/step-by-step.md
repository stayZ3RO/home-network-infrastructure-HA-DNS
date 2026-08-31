# Phase 1 Step-by-Step: Network Control 🧱

## Goal

Move the home network from ISP-controlled routing to a cleaner Deco-controlled baseline.

---

## Step 1: Deploy Deco Mesh First

1. Connect the main Deco node to the Xfinity gateway.
2. Power on the Deco node.
3. Open the Deco app.
4. Configure the Deco system in router mode.
5. Add the remaining mesh nodes.
6. Validate Wi-Fi and internet access.

Validation:

- Phone connects to Deco Wi-Fi
- Laptop connects to Deco Wi-Fi
- Internet works normally
- Deco app shows the network online

---

## Step 2: Enable Bridge Mode

1. Log into the Xfinity gateway.
2. Enable bridge mode.
3. Let the gateway reboot if required.
4. Confirm the Deco receives the upstream connection.

Validation:

- Deco acts as router
- Internet access still works
- Clients stay behind the Deco network

---

## Step 3: Disable ISP Wi-Fi If Needed

Bridge mode may not always disable ISP Wi-Fi automatically.

If the old Xfinity SSID is still visible:

1. Open the gateway Wi-Fi settings.
2. Disable 2.4 GHz Wi-Fi.
3. Disable 5 GHz Wi-Fi.
4. Confirm only Deco Wi-Fi remains.

---

## Step 4: Connect Wired Expansion

1. Connect the switch to the main Deco node.
2. Connect the desktop or other wired test client to the switch.
3. Confirm wired connectivity.

Validation:

- Wired client receives an IP address
- Wired client can reach the internet
- Wi-Fi and wired clients remain on the same expected LAN

---

## Step 5: Prepare For DNS Control

Reserve or plan IP space for future infrastructure services.

Early planning targets:

| Service | Purpose |
|---|---|
| Pi-hole primary | First DNS server |
| Pi-hole secondary | Future redundancy |
| HA DNS VIP | Future shared DNS address |
| Admin endpoint | Troubleshooting and validation |

---

## Final Validation

- Deco is the active router
- Xfinity gateway is bridged
- ISP Wi-Fi is disabled
- Wi-Fi and wired clients work
- Network is ready for Pi-hole DNS

---

## Result

Phase 1 completed the network baseline and prepared the lab for DNS control.
