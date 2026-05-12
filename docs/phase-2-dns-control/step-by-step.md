# Phase 2 Step-by-Step — DNS Control with Pi-hole 🕳️

## Goal

Deploy Pi-hole and make clients use it for DNS resolution.

---

## Step 1 — Prepare The Raspberry Pi

1. Connect the Pi to the network.
2. Update the OS.
3. Confirm SSH access.
4. Assign or reserve a stable IP address.

Validation:

- Pi is reachable on the LAN
- SSH works
- Pi can reach the internet

---

## Step 2 — Install Pi-hole

Install Pi-hole on the Raspberry Pi and complete the web setup.

Validation:

- Pi-hole web UI loads
- DNS service is running
- dashboard shows status as active

---

## Step 3 — Update Router DNS Settings

In the router DHCP settings, set the DNS server to the Pi-hole IP.

Validation:

- new DHCP clients receive Pi-hole as DNS
- existing clients renew or reconnect
- clients resolve domains successfully

---

## Step 4 — Confirm DNS Query Visibility

Open the Pi-hole dashboard.

Check for:

- live client queries
- blocked queries
- client names or IP addresses
- increasing query counters

---

## Step 5 — Validate From A Client

From a client machine:

```text
nslookup google.com
```

Confirm the DNS server shown is the Pi-hole.

---

## Result

Clients now use Pi-hole for DNS, giving the lab centralized visibility and filtering.
