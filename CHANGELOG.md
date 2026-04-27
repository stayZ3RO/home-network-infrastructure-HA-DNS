# Changelog

This changelog tracks major changes made to the Home Network Infrastructure Lab.

---

## Phase 6 — Proxmox Infrastructure & Omada Network Foundation

### Added

- Installed Proxmox on a Dell OptiPlex as the dedicated infrastructure host.
- Created an Omada Controller LXC.
- Assigned Omada Controller to the management IP plan.
- Created an Ubuntu Docker VM for monitoring services.
- Migrated Grafana, Prometheus, Alertmanager, and Blackbox Exporter from the gaming PC to Proxmox.
- Restored Docker volumes for Grafana, Prometheus, and Alertmanager.
- Added HDD-backed storage for backups, ISO images, templates, and archives.
- Preconfigured the ER605 router for the future network cutover.
- Defined managed switch IP plan and initial port plan.
- Added Phase 6 documentation and validation screenshots.
- Added architecture diagrams for current and future phases.

### Changed

- Monitoring no longer depends on Docker Desktop running on the gaming PC.
- Phase 5 folder renamed to clarify Tailscale-based remote access.
- Phase 6 renamed to better reflect Proxmox, Omada, and infrastructure foundation work.
- Project roadmap updated to include Phase 6.5, Phase 7, and Phase 8.

### Validated

- Proxmox host reachable at `192.168.68.80`.
- Omada Controller reachable from the LAN.
- Grafana reachable from the Docker VM at `192.168.68.81:3000`.
- Monitoring containers run from the Proxmox-hosted Ubuntu Docker VM.
- Proxmox backups use dedicated storage.

---

## Phase 5 — Tailscale Remote Access

### Added

- Tailscale secure remote access.
- Remote SSH/admin access to lab devices.
- Remote access validation from non-local devices.

### Changed

- Reduced need for direct local-only administration.
- Avoided exposing internal admin services directly to the public internet.

---

## Phase 4 — Monitoring & Alerting

### Added

- Grafana dashboards.
- Prometheus metrics collection.
- Alertmanager alert routing.
- Blackbox Exporter endpoint checks.
- DNS and service health visibility.

### Validated

- DNS health checks.
- Pi-hole node visibility.
- Monitoring dashboards.
- Alert behavior.

---

## Phase 3 — High Availability DNS

### Added

- Second Pi-hole node.
- Keepalived virtual IP.
- Gravity Sync replication.
- Unbound recursive DNS on both Pi-hole nodes.
- Failover validation.

### Changed

- DNS moved from single-node dependency to HA design.
- Pi-hole VIP became the primary DNS target.

---

## Phase 2 — DNS Control

### Added

- Pi-hole DNS filtering.
- Centralized DNS visibility.
- DNS configuration documentation.

---

## Phase 1.5 — ISP Migration

### Added

- AT&T Fiber topology.
- ONT and AT&T Gateway documentation.
- IP Passthrough documentation.

### Changed

- Migrated away from Xfinity bridge-mode topology.
- Updated network diagrams to reflect AT&T Fiber.

---

## Phase 1 — Network Control

### Added

- Initial network documentation.
- Baseline topology.
- Network control plan.
- Initial lessons learned.
