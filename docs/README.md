# Documentation Hub 📚

This folder contains the phase-based documentation for the Home Network Infrastructure Lab.

Each phase is documented as a small infrastructure case study:

- What was built
- Why it mattered
- How it was implemented
- How it was validated
- What screenshots or evidence support the work
- What came next

---

## Phase Index

| Phase | Status | Documentation |
|---|---:|---|
| Phase 1 - Network Control | ✅ Complete | [Overview](phase-1-network-control.md) |
| Phase 1.5 - ISP Migration | ✅ Complete | [Overview](phase-1.5-isp-migration.md) |
| Phase 2 - DNS Control | ✅ Complete | [Overview](phase-2-dns-control.md) |
| Phase 3 - High Availability DNS | ✅ Complete | [View Phase Folder](phase-3-ha-dns/) |
| Phase 4 - Monitoring and Alerting | ✅ Complete | [View Phase Folder](phase-4-monitoring-alerting/) |
| Phase 5 - Tailscale Remote Access | ✅ Complete | [View Phase Folder](phase-5-tailscale-remote-access/) |
| Phase 6 - Proxmox, Omada, Docker Monitoring | ✅ Complete | [View Phase Folder](phase-6-proxmox-omada/) |
| Phase 6.5 - RustDesk Remote Access | ✅ Complete | [View Phase Folder](phase-6.5-rustdesk-remote-access/) |
| Project Closeout | ✅ Complete | [View Closeout](project-closeout.md) |

---

## Current Project State

This project is complete and closed out.

The final state includes:

- Centralized DNS control
- HA Pi-hole DNS with VIP failover
- Local recursive DNS with Unbound
- Monitoring and alerting
- Secure remote access
- Proxmox-hosted infrastructure services
- Self-hosted RustDesk remote access
- Validation screenshots and documentation

---

## Documentation Pattern

Completed phase folders generally include:

| File | Purpose |
|---|---|
| README.md | Phase landing page |
| overview.md | Case-study style summary |
| step-by-step.md | Implementation guide |
| validation.md | Evidence and verification |
| diagrams.md | Phase-specific architecture |
| screenshots | Redacted proof of implementation |

---

## Related Project Files

| File | Purpose |
|---|---|
| [Current Status](../CURRENT-STATUS.md) | Final project state |
| [Roadmap](../ROADMAP.md) | Completed project roadmap |
| [Lessons Learned](../LESSONS-LEARNED.md) | Operational notes and takeaways |
| [Changelog](../CHANGELOG.md) | Major documentation and infrastructure updates |
