# Lessons Learned

This document captures the technical lessons learned while building the Home Network Infrastructure Lab.

---

## Network Control

- Understanding the role of each device matters before making changes.
- ISP gateways, routers, switches, DNS servers, and clients all have separate responsibilities.
- A stable IP plan makes future expansion easier.
- Documenting the baseline network helps reduce confusion during later changes.

---

## ISP Migration

- Xfinity bridge mode and AT&T IP Passthrough solve similar problems differently.
- ISP equipment behavior affects topology, NAT, routing, and troubleshooting.
- Migrating ISPs is not just a speed change; it can change how the entire edge network is designed.
- Updating diagrams after ISP changes helps prevent outdated assumptions.

---

## DNS Control

- Centralized DNS gives better visibility into client behavior.
- Pi-hole works best when DHCP consistently hands out the Pi-hole DNS address.
- DNS changes can appear broken if clients keep old leases or cached DNS settings.
- DNS should be treated as a core infrastructure service, not just an ad-blocking tool.

---

## High Availability DNS

- A single Pi-hole creates a single point of failure.
- Keepalived allows multiple nodes to share a virtual IP.
- Gravity Sync keeps Pi-hole configuration consistent between nodes.
- Unbound adds local recursive DNS capability.
- Failover should be tested intentionally, not assumed.

---

## Monitoring and Alerting

- Monitoring makes infrastructure issues easier to see and explain.
- Grafana provides useful visibility for both technical validation and documentation.
- Prometheus is useful for collecting metrics over time.
- Blackbox Exporter helps validate endpoint and DNS availability.
- Alertmanager adds operational awareness instead of relying on manual checks.

---

## Remote Access

- Remote access should be secure by design.
- Tailscale provides a safer remote access model without exposing internal services directly.
- Remote SSH access should be tested from multiple devices.
- Remote access becomes more valuable as the lab grows beyond a single device.

---

## Proxmox and Virtualization

- A dedicated virtualization host is better for always-on services than a gaming PC.
- Proxmox makes the lab feel more like a real infrastructure environment.
- Separating services into VMs and LXCs improves organization and recovery options.
- The gaming PC should not be required for core infrastructure services.
- VM/LXC backups are easier to manage when storage is planned early.

---

## Docker Migration

- Docker images are replaceable; persistent data is not.
- Compose files, `.env` files, bind mounts, and named volumes are the critical backup items.
- Stopping a stack before backing up volumes reduces risk of inconsistent data.
- Restoring Grafana and Prometheus data requires restoring named Docker volumes correctly.
- Moving monitoring to the Proxmox Docker VM removed the gaming PC dependency.

---

## Omada Controller and Network Management

- Running the Omada Controller as an LXC avoids needing a hardware controller.
- The controller should have a static IP and be documented clearly.
- Preconfiguring the ER605 before live cutover reduces downtime.
- Adopting and staging the managed switch before cutover makes the transition safer.
- Keeping the network flat before VLANs makes troubleshooting easier.

---

## Storage and Backups

- Active workloads and backup storage should be planned separately.
- HDD-backed storage is useful for backups, ISOs, templates, and archives.
- Proxmox backups provide a cleaner recovery path for infrastructure services.
- A service is not truly stable until there is a recovery plan.

---

## Cutover Planning

- Router cutovers should be treated like maintenance windows.
- Only one device should own the gateway IP at a time.
- Router, DHCP, DNS, and Wi-Fi role changes should be done in a controlled order.
- Deco AP mode should come after routing duties move to the ER605.
- VLANs should not be introduced until the flat router/switch cutover is stable.

---

## VLAN Planning

- VLANs are a security and organization tool, not something to rush into.
- Management, production, lab, and IoT/guest traffic should eventually be separated.
- Firewall rules are just as important as VLAN creation.
- DNS across VLANs needs to be planned carefully so filtering still works.
- Segmentation should be validated with real client tests.

---

## Documentation

- Screenshots prove the work was actually completed.
- Diagrams make the project easier to understand quickly.
- Step-by-step documentation is useful for troubleshooting and future rebuilding.
- Phase-based documentation keeps the project organized.
- A clean README, roadmap, changelog, and lessons learned file make the repo stronger for professional review.
