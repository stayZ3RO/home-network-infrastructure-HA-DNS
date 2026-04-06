# DNS Configuration Plan

## Primary DNS

192.168.68.10 (Pi-hole)

---

## Future HA DNS

192.168.68.20 (Virtual IP)

---

## Upstream DNS

Cloudflare (1.1.1.1)

---

## Design

* All clients receive DNS via DHCP
* Pi-hole acts as centralized DNS resolver
* DNS traffic is logged and filtered

---

## Notes

* No secondary DNS to prevent bypass
* DNS enforced at router level
