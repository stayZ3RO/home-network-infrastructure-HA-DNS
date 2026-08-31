# Phase 2 Overview: DNS Control with Pi-hole 🕳️

## Introduction

After establishing a controlled network baseline, the next step was to control DNS.

Pi-hole was introduced to provide DNS filtering, client query visibility, and a foundation for later high availability.

---

## Objectives

- Deploy Pi-hole on a Raspberry Pi
- Point DHCP-provided DNS to Pi-hole
- Validate client DNS resolution
- Confirm DNS queries appear in the Pi-hole dashboard
- Establish DNS as a core infrastructure service

---

## Hardware / Services

| Component | Role |
|---|---|
| Raspberry Pi | Pi-hole host |
| Deco Router | DHCP and network routing |
| Laptop / Desktop / Phone | Test clients |
| Pi-hole | DNS filtering and query visibility |

---

## Architecture

```text
Clients → Deco DHCP → Pi-hole DNS → Upstream Resolver
```

---

## Key Changes

| Change | Result |
|---|---|
| Pi-hole installed | DNS became self-managed |
| Router DNS updated | Clients received Pi-hole as DNS |
| Query logging enabled | Client DNS activity became visible |
| Blocking enabled | Ads and tracking domains could be filtered |

---

## Lessons Learned

- DNS must be distributed through DHCP to affect most clients.
- Devices may need reconnects or DHCP lease renewals before picking up new DNS.
- DNS visibility makes troubleshooting easier.
- A single DNS server creates a future single point of failure, which is addressed in Phase 3.

---

## Result

Pi-hole became the central DNS service for the home network.
