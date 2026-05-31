# Phase 12 Project 1 Maturity Audit

## Summary

- Total files scanned: 223
- Markdown files scanned: 59
- Image files scanned: 141
- Broken relative links: 0
- Backup/temp files: 3
- Image issues: 5
- Likely blank screenshots: 0
- Stale wording hits: 31
- Public-safety keyword hits: 103
- Pillow blank-image detection available: False

## Broken Relative Links

- None found.

## Backup / Temporary Files

- `README.md.bak`
- `docs/phase-6-proxmox-omada-foundation/diagrams.md.bak`
- `docs/phase-3-ha-dns/diagrams.md.bak`

## Image Issues

- `screenshots/phase-6/05-er605-address-reservations.jpeg` — could not read basic image dimensions
- `screenshots/phase-6/06-er605-lan-dhcp-pihole-dns.jpeg` — could not read basic image dimensions
- `screenshots/phase-6/03-proxmox-node-summary.jpeg` — could not read basic image dimensions
- `screenshots/phase-6/02-proxmox-storage-layout-before-hdd.jpeg` — could not read basic image dimensions
- `screenshots/phase-6/01-omada-lxc-package-install.jpeg` — could not read basic image dimensions

## Likely Blank Screenshots

- Skipped because Pillow is not installed.

## Stale Wording Hits

- `LESSONS-LEARNED.md:126` matched `\bpending\b` — - Alert pending state
- `LESSONS-LEARNED.md:85` matched `\bnot complete\b` — HA is not complete until failover and recovery are tested.
- `docs/phase-6-proxmox-omada-foundation/overview.md:7` matched `\bDocker Desktop\b` — Before this phase, the monitoring stack depended on the gaming PC running Docker Desktop. That was useful for initial validation, but it was not ideal for always-on infrastructure.
- `docs/phase-6-proxmox-omada-foundation/overview.md:30` matched `\bDocker Desktop\b` — └── Docker Desktop / WSL
- `docs/phase-6-proxmox-omada-foundation/overview.md:40` matched `\bDocker Desktop\b` — - Docker Desktop had to stay running
- `docs/phase-6-proxmox-omada-foundation/step-by-step.md:74` matched `\bDocker Desktop\b` — Stopped the old Docker Desktop monitoring stack.
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:5` matched `\bPhase 7\b` — This document covers the managed switch pre-staging completed before the Phase 7 router and switch cutover.
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:25` matched `\bPhase 7\b` — - the switch was ready to become the core switch during Phase 7
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:42` matched `\bPhase 7\b` — The final management IP of `192.168.68.2` will be assigned during Phase 7 after the ER605 becomes the active router/DHCP server.
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:46` matched `\bPhase 7\b` — ## Target Phase 7 Switch Configuration
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:73` matched `\bPhase 7\b` — During Phase 7 cutover, Port 1 will become the uplink to the ER605 LAN.
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:153` matched `\bPhase 7\b` — The switch was adopted into Omada, validated on the existing flat LAN, and confirmed ready for the Phase 7 cutover.
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:161` matched `\bPhase 7\b` — Phase 7 will move the ER605 into the live network path, make the managed switch the core switch, and place the Deco mesh into AP mode.
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:9` matched `\bPhase 8\b` — This was completed before VLAN segmentation. VLANs will be handled later in Phase 8.
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:54` matched `\bPhase 8\b` — | VLAN State | Flat LAN during cutover, VLANs later in Phase 8 |
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:163` matched `\bPhase 8\b` — VLAN segmentation will be completed later in Phase 8.
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:81` matched `\bpending\b` — 3. Confirmed the switch appeared as pending adoption.
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:117` matched `\bpending\b` — ### Switch Pending Adoption
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:119` matched `\bpending\b` — ![Switch pending adoption](../../screenshots/phase-6/switch-prep/01-switch-pending-adoption.png)
- `docs/phase-6-proxmox-omada-foundation/managed-switch-prep.md:119` matched `\bpending\b` — ![Switch pending adoption](../../screenshots/phase-6/switch-prep/01-switch-pending-adoption.png)
- `docs/phase-4-monitoring-alerting/overview.md:279` matched `\bnext phase\b` — With monitoring and alerting complete, the next phase is **secure remote access** and administrative path hardening.
- `docs/phase-4-monitoring-alerting/overview.md:244` matched `\bpending\b` — - a single-node-down alert moved from pending → firing → cleared
- `docs/phase-4-monitoring-alerting/dashboards.md:231` matched `\bpending\b` — Shows currently pending or firing alerts related to the monitoring stack and HA DNS service path.
- `docs/phase-4-monitoring-alerting/step-by-step.md:388` matched `\bpending\b` — 2. observed alert move to pending
- `docs/phase-4-monitoring-alerting/step-by-step.md:397` matched `\bpending\b` — The alert lifecycle behaved as expected from pending → firing → cleared.
- `docs/phase-4-monitoring-alerting/alerting.md:267` matched `\bpending\b` — A full pending → firing → cleared test was performed by stopping and restoring Node Exporter on `ashpi-2`.
- `docs/phase-4-monitoring-alerting/alerting.md:313` matched `\bpending\b` — The **DNS & Failover** dashboard includes an **Active Alerts** panel so currently pending or firing alerts can be seen directly from the operational dashboard.
- `docs/phase-4-monitoring-alerting/README.md:29` matched `\bpending\b` — | Validation | Pending, firing, recovery, and failover behavior |
- `docs/phase-4-monitoring-alerting/validation.md:144` matched `\bpending\b` — 1. enter pending
- `docs/phase-4-monitoring-alerting/validation.md:152` matched `\bpending\b` — The full pending → firing → cleared lifecycle was observed successfully.
- `docs/phase-3-ha-dns/overview.md:194` matched `\bnext phase\b` — With the HA DNS layer complete, the next phase is to build **monitoring and alerting** so the environment can be observed more like a production service.

## Public-Safety Keyword Hits

- `README.md:203` matched `token` — - Screenshots should be reviewed for public IPs, MAC addresses, serial numbers, QR codes, tokens, webhook URLs, and personal identifiers before sharing externally.
- `README.md:204` matched `token` — - Secrets, passwords, tokens, and private keys are not committed.
- `README.md:201` matched `secret` — - Discord webhook secrets are stored locally and excluded from Git.
- `README.md:204` matched `secret` — - Secrets, passwords, tokens, and private keys are not committed.
- `README.md:217` matched `secret` — - Secret handling
- `README.md:204` matched `password` — - Secrets, passwords, tokens, and private keys are not committed.
- `README.md:153` matched `webhook` — | Discord Webhooks | Alert delivery |
- `README.md:201` matched `webhook` — - Discord webhook secrets are stored locally and excluded from Git.
- `README.md:203` matched `webhook` — - Screenshots should be reviewed for public IPs, MAC addresses, serial numbers, QR codes, tokens, webhook URLs, and personal identifiers before sharing externally.
- `README.md:204` matched `private key` — - Secrets, passwords, tokens, and private keys are not committed.
- `.github/pull_request_template.md:19` matched `token` — - [ ] I confirmed no `.env`, private keys, credentials, tokens, or sensitive files were added
- `.github/pull_request_template.md:19` matched `private key` — - [ ] I confirmed no `.env`, private keys, credentials, tokens, or sensitive files were added
- `configs/README.md:27` matched `token` — - API tokens
- `configs/README.md:31` matched `secret` — - Real secrets
- `configs/README.md:26` matched `password` — - Passwords
- `configs/README.md:28` matched `webhook` — - Discord webhook URLs
- `configs/README.md:30` matched `private key` — - Private keys
- `screenshots/README.md:34` matched `token` — - Authentication tokens
- `screenshots/README.md:30` matched `secret` — - Secret values
- `screenshots/README.md:33` matched `password` — - Passwords
- `screenshots/README.md:32` matched `webhook` — - Webhook URLs
- `docs/phase-4-monitoring-alerting/overview.md:138` matched `secret` — - the Discord webhook URL was stored locally as a secret file
- `docs/phase-4-monitoring-alerting/overview.md:139` matched `secret` — - the webhook secret was excluded from Git using `.gitignore`
- `docs/phase-4-monitoring-alerting/overview.md:223` matched `secret` — alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/overview.md:226` matched `secret` — The secret is mounted into the Alertmanager container as read-only:
- `docs/phase-4-monitoring-alerting/overview.md:229` matched `secret` — /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/overview.md:138` matched `webhook` — - the Discord webhook URL was stored locally as a secret file
- `docs/phase-4-monitoring-alerting/overview.md:139` matched `webhook` — - the webhook secret was excluded from Git using `.gitignore`
- `docs/phase-4-monitoring-alerting/overview.md:215` matched `webhook` — Discord webhook
- `docs/phase-4-monitoring-alerting/overview.md:220` matched `webhook` — The webhook URL is stored locally at:
- `docs/phase-4-monitoring-alerting/overview.md:223` matched `webhook` — alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/overview.md:229` matched `webhook` — /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/overview.md:232` matched `webhook` — This keeps the webhook out of the public GitHub repository.
- `docs/phase-4-monitoring-alerting/step-by-step.md:327` matched `secret` — 1. created a local Alertmanager secrets folder
- `docs/phase-4-monitoring-alerting/step-by-step.md:328` matched `secret` — 2. stored the Discord webhook URL in a local secret file
- `docs/phase-4-monitoring-alerting/step-by-step.md:329` matched `secret` — 3. mounted the secret into the Alertmanager container as read-only
- `docs/phase-4-monitoring-alerting/step-by-step.md:331` matched `secret` — 5. added the secret path to `.gitignore`
- `docs/phase-4-monitoring-alerting/step-by-step.md:335` matched `secret` — ### Secret file path on the Docker host
- `docs/phase-4-monitoring-alerting/step-by-step.md:338` matched `secret` — alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/step-by-step.md:341` matched `secret` — ### Secret file path inside the Alertmanager container
- `docs/phase-4-monitoring-alerting/step-by-step.md:344` matched `secret` — /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/step-by-step.md:350` matched `secret` — - ./alertmanager/secrets:/etc/alertmanager/secrets:ro
- `docs/phase-4-monitoring-alerting/step-by-step.md:350` matched `secret` — - ./alertmanager/secrets:/etc/alertmanager/secrets:ro
- `docs/phase-4-monitoring-alerting/step-by-step.md:359` matched `secret` — - webhook_url_file: /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/step-by-step.md:365` matched `secret` — After adding the new secret volume, the Alertmanager container had to be recreated, not just restarted.
- `docs/phase-4-monitoring-alerting/step-by-step.md:448` matched `secret` — - webhook secrets were not included in Git
- `docs/phase-4-monitoring-alerting/step-by-step.md:46` matched `webhook` — - Discord webhook created for the `homelab-alerts` Discord server
- `docs/phase-4-monitoring-alerting/step-by-step.md:311` matched `webhook` — Discord notifications were configured through Alertmanager using an existing Discord webhook.
- `docs/phase-4-monitoring-alerting/step-by-step.md:320` matched `webhook` — Discord webhook
- `docs/phase-4-monitoring-alerting/step-by-step.md:328` matched `webhook` — 2. stored the Discord webhook URL in a local secret file
- `docs/phase-4-monitoring-alerting/step-by-step.md:330` matched `webhook` — 4. updated `alertmanager.yml` to use `webhook_url_file`
- `docs/phase-4-monitoring-alerting/step-by-step.md:338` matched `webhook` — alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/step-by-step.md:344` matched `webhook` — /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/step-by-step.md:359` matched `webhook` — - webhook_url_file: /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/step-by-step.md:359` matched `webhook` — - webhook_url_file: /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/step-by-step.md:373` matched `webhook` — - the webhook file existed on the Docker host
- `docs/phase-4-monitoring-alerting/step-by-step.md:374` matched `webhook` — - the webhook file existed inside the Alertmanager container
- `docs/phase-4-monitoring-alerting/step-by-step.md:448` matched `webhook` — - webhook secrets were not included in Git
- `docs/phase-4-monitoring-alerting/alerting.md:198` matched `secret` — ## Discord Webhook Secret Handling 🔐
- `docs/phase-4-monitoring-alerting/alerting.md:205` matched `secret` — alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/alerting.md:211` matched `secret` — /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/alerting.md:217` matched `secret` — - ./alertmanager/secrets:/etc/alertmanager/secrets:ro
- `docs/phase-4-monitoring-alerting/alerting.md:217` matched `secret` — - ./alertmanager/secrets:/etc/alertmanager/secrets:ro
- `docs/phase-4-monitoring-alerting/alerting.md:224` matched `secret` — - webhook_url_file: /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/alerting.md:228` matched `secret` — The secret file is excluded from Git using `.gitignore`.
- `docs/phase-4-monitoring-alerting/alerting.md:231` matched `secret` — # Alertmanager secrets
- `docs/phase-4-monitoring-alerting/alerting.md:232` matched `secret` — alertmanager/secrets/
- `docs/phase-4-monitoring-alerting/alerting.md:233` matched `secret` — *.secret
- `docs/phase-4-monitoring-alerting/alerting.md:251` matched `secret` — A key troubleshooting step was recreating the Alertmanager container after adding the new secret mount:
- `docs/phase-4-monitoring-alerting/alerting.md:175` matched `webhook` — Discord webhook
- `docs/phase-4-monitoring-alerting/alerting.md:194` matched `webhook` — The Discord server/channel destination is controlled by the webhook URL.
- `docs/phase-4-monitoring-alerting/alerting.md:198` matched `webhook` — ## Discord Webhook Secret Handling 🔐
- `docs/phase-4-monitoring-alerting/alerting.md:200` matched `webhook` — The Discord webhook URL is stored locally on the monitoring host.
- `docs/phase-4-monitoring-alerting/alerting.md:205` matched `webhook` — alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/alerting.md:211` matched `webhook` — /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/alerting.md:224` matched `webhook` — - webhook_url_file: /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/alerting.md:224` matched `webhook` — - webhook_url_file: /etc/alertmanager/secrets/discord_webhook_url
- `docs/phase-4-monitoring-alerting/alerting.md:245` matched `webhook` — - the webhook file existed on the host
- `docs/phase-4-monitoring-alerting/alerting.md:246` matched `webhook` — - the webhook file was mounted into the Alertmanager container
- `docs/phase-4-monitoring-alerting/alerting.md:247` matched `webhook` — - Alertmanager could read the webhook file
- `docs/phase-4-monitoring-alerting/validation.md:168` matched `secret` — - Alertmanager reads the Discord webhook from a local secret file
- `docs/phase-4-monitoring-alerting/validation.md:181` matched `secret` — 1. confirming the secret existed on the Docker host
- `docs/phase-4-monitoring-alerting/validation.md:182` matched `secret` — 2. mounting `./alertmanager/secrets` into the container
- `docs/phase-4-monitoring-alerting/validation.md:184` matched `secret` — 4. verifying the webhook file existed inside `/etc/alertmanager/secrets`
- `docs/phase-4-monitoring-alerting/validation.md:265` matched `secret` — - secrets are excluded from Git
- `docs/phase-4-monitoring-alerting/validation.md:168` matched `webhook` — - Alertmanager reads the Discord webhook from a local secret file
- `docs/phase-4-monitoring-alerting/validation.md:171` matched `webhook` — - the webhook URL is not committed to GitHub
- `docs/phase-4-monitoring-alerting/validation.md:177` matched `webhook` — During testing, Alertmanager initially failed because the webhook file was not visible inside the container.
- `docs/phase-4-monitoring-alerting/validation.md:184` matched `webhook` — 4. verifying the webhook file existed inside `/etc/alertmanager/secrets`
- `docs/phase-4-monitoring-alerting/validation.md:194` matched `webhook` — Discord webhook
- `docs/phase-3-ha-dns/jump-box-access.md:78` matched `password` — - validating passwordless SSH access
- `docs/phase-3-ha-dns/jump-box-access.md:79` matched `password` — - confirming that administrative commands could be run without repeated password prompts
- `docs/phase-3-ha-dns/jump-box-access.md:115` matched `password` — - passwordless SSH worked successfully
- `docs/phase-3-ha-dns/jump-box-access.md:129` matched `password` — ![SSH no password confirmation](../../screenshots/phase-3/6-ssh-nopassword-confirmation.png)
- `docs/phase-3-ha-dns/jump-box-access.md:129` matched `password` — ![SSH no password confirmation](../../screenshots/phase-3/6-ssh-nopassword-confirmation.png)
- `docs/phase-3-ha-dns/overview.md:117` matched `password` — - configured passwordless SSH between nodes
- `docs/phase-3-ha-dns/step-by-step.md:79` matched `password` — 3. verified passwordless SSH access
- `docs/phase-3-ha-dns/step-by-step.md:86` matched `password` — - passwordless SSH worked successfully
- `docs/phase-3-ha-dns/step-by-step.md:92` matched `password` — ![SSH no password confirmation](../../screenshots/phase-3/6-ssh-nopassword-confirmation.png)
- `docs/phase-3-ha-dns/step-by-step.md:92` matched `password` — ![SSH no password confirmation](../../screenshots/phase-3/6-ssh-nopassword-confirmation.png)
- `docs/phase-3-ha-dns/step-by-step.md:362` matched `password` — - [x] passwordless SSH configured between nodes
- `docs/phase-6.5-rustdesk-remote-access/screenshots-checklist.md:44` matched `token` — - Portainer usernames or tokens
- `configs/phase-4-monitoring-alerting/README.md:17` matched `password` — - The Grafana admin password in `docker-compose.yml` has been sanitized and replaced with `CHANGE_ME`.

## Notes

- This audit is read-only.
- Public-safety keyword hits are not automatically issues; review context before changing.
- Stale wording hits are not automatically issues; historical phase documentation may legitimately describe older states.
- Manual review is still required for screenshot content, redaction, and portfolio quality.
