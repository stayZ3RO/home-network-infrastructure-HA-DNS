# Phase 1.5 Step-by-Step — ISP Migration 🌐

## Goal

Move from Xfinity to AT&T Fiber while keeping the internal lab network stable.

---

## Step 1 — Document The Existing Network

Before changing the ISP path, document the working baseline:

```text
Internet → Xfinity Gateway → Deco Router → Clients
```

Capture:

- active router
- current LAN subnet
- DNS settings
- key client connectivity

---

## Step 2 — Install / Identify The Fiber Path

AT&T Fiber introduces an ONT.

Final physical path:

```text
Fiber → ONT → AT&T Gateway → Deco Router
```

Validation:

- ONT powered on
- AT&T gateway online
- service active

---

## Step 3 — Configure IP Passthrough

In the AT&T gateway:

1. Open firewall / passthrough settings.
2. Enable IP Passthrough.
3. Assign passthrough to the Deco router.
4. Save and reboot if required.

Validation:

- Deco receives the upstream address
- clients keep internet access
- no unnecessary extra routing is introduced inside the LAN

---

## Step 4 — Preserve Internal Network Design

Do not redesign the LAN during the ISP migration.

Keep:

- Deco as internal router
- existing LAN addressing
- existing DNS plan
- existing client Wi-Fi

---

## Step 5 — Validate DNS and Internet

From a client:

```text
ping 1.1.1.1
ping google.com
nslookup google.com
```

Also check Pi-hole:

- dashboard reachable
- client queries visible
- DNS resolution working

---

## Result

The ISP migration completed without breaking the internal network foundation.
