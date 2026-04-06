# Phase 2 – Step-by-Step Guide

## Goal

Deploy Pi-hole as the primary DNS server so all devices on the network use centralized DNS filtering and logging.

---

## Hardware Used

- Raspberry Pi (primary DNS node)
- MicroSD card
- Ethernet connection
- TP-Link Deco mesh system
- Desktop or laptop for SSH

---

## Before You Start

Make sure:

- Phase 1 is complete
- Deco is the primary router
- Pi is connected via Ethernet
- SSH is enabled
- Pi is visible in the network (Deco app)

---

## Step 1 – Flash Raspberry Pi OS

1. Open Raspberry Pi Imager
2. Select Raspberry Pi OS Lite (64-bit)
3. Select SD card
4. Open advanced settings

Set:

- Hostname: pihole-1
- Username: pi
- Password: your choice
- Enable SSH (password auth)
- Skip WiFi

5. Flash SD card
6. Insert into Pi

Verify:

- Flash completes successfully

---

## Step 2 – Boot and Connect Pi

1. Insert SD card
2. Connect Ethernet to switch
3. Power on Pi
4. Wait 1–2 minutes

Verify:

- Pi appears in Deco app
- Pi receives IP address

---

## Step 3 – Find Pi IP

Use Deco app:

- Look for device: pihole-1
- Note IP (example: 192.168.1.10)

---

## Step 4 – Reserve IP

In Deco app:

1. Go to More → Advanced → Address Reservation
2. Select Pi
3. Assign IP:

192.168.1.10

4. Save
5. Reboot Pi

Verify:

- Pi now uses reserved IP

---

## Step 5 – SSH into Pi

From terminal:

ssh pi@192.168.1.10

Enter password

Verify:

- SSH login works
- You see pi@pihole-1 prompt

---

## Step 6 – Update System

Run:

sudo apt update && sudo apt upgrade -y

Verify:

- Update completes successfully

---

## Step 7 – Install Pi-hole

Run:

curl -sSL https://install.pi-hole.net | bash

During setup choose:

- Interface: eth0
- Static IP: confirm 192.168.1.10
- Upstream DNS: Cloudflare (1.1.1.1)
- Blocklists: default
- Web UI: Yes
- Logging: Yes

Verify:

- Installation completes
- Admin password shown

---

## Step 8 – Access Dashboard

Open browser:

http://192.168.68.10/admin

Login using password

Verify:

- Dashboard loads
- Login works

---

## Step 9 – Set DNS in Router

In Deco app:

1. Go to More → Advanced → DHCP Server
2. Set:

Primary DNS: 192.168.68.60  
Secondary DNS: leave blank

Save

Verify:

- DNS saved successfully

---

## Step 10 – Refresh Devices

On all devices:

- Toggle WiFi off/on OR
- Restart device

Verify:

- Devices reconnect successfully

---

## Step 11 – Verify Pi-hole

Test DNS traffic:

- Open Pi-hole dashboard
- Confirm queries increasing

Test blocking:

http://doubleclick.net

Verify:

- Query appears in Pi-hole
- Domain is blocked

---

## Step 12 – Screenshots to Capture

- Pi visible in network
- SSH session
- Pi-hole install complete
- Pi-hole dashboard
- DNS settings in Deco
- Live queries
- Ad blocking proof

---

## Final Validation Checklist

- Pi reachable at reserved IP
- SSH works
- Pi-hole dashboard accessible
- DNS configured in router
- Queries visible in dashboard
- Devices browsing normally
- Ads blocked

---

## Result

- Pi-hole is now the network DNS server
- DNS traffic is centralized
- Ad/tracking domains are blocked
- Network visibility is improved

---

## Next Step

Proceed to Phase 3:

- Add second Pi-hole node
- Configure Gravity Sync
- Implement Keepalived
- Create virtual IP for failover
