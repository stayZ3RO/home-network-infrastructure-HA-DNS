# Lessons Learned 🧠

## Network Foundation

- Bridge mode and IP Passthrough solve similar problems differently depending on the ISP.
- Router, gateway, and access point roles should be clearly separated.
- Planning the IP structure early makes later infrastructure work easier.
- A clean baseline network reduces confusion during later changes.

---

## ISP and Edge Design

- Xfinity bridge mode and AT&T IP Passthrough behave differently.
- Fiber introduces the ONT as an additional infrastructure layer.
- ISP equipment behavior affects topology, NAT, routing, and troubleshooting.
- Updating diagrams after ISP changes prevents outdated assumptions.

---

## DNS and Pi-hole

- DNS must be distributed through DHCP to affect most clients consistently.
- Pi-hole provides visibility and control, not just ad blocking.
- DNS issues can look like general internet issues to end users.
- Client lease renewals and cached DNS settings can delay visible results.

---

## High Availability DNS

- A single Pi-hole instance is still a single point of failure.
- HA DNS requires both redundancy and validation.
- A VIP simplifies client configuration by keeping one consistent DNS target.
- Failover must be tested from the client perspective.

---

## Gravity Sync

- Multiple Pi-hole nodes need synchronized records, blocklists, and settings.
- Replication reduces drift and manual effort.
- HA is weaker when nodes behave differently.

---

## Keepalived and VIP Failover

- VIP movement alone is not enough; real DNS queries must still succeed.
- The standby node must be fully functional before testing failover.
- Failover should be validated with normal client behavior, not just service status.

---

## Recursive DNS with Unbound

- Running Unbound locally removes dependency on public upstream resolvers.
- Each Pi-hole node should use its own local Unbound instance.
- Recursive DNS should be tested directly and through the VIP path.

---

## Monitoring and Alerting

- Metrics collection and service probing solve different problems.
- Node Exporter monitors host health; Blackbox Exporter validates service behavior.
- Monitoring should observe the service path, not just the host.
- Healthy failover should not be treated as an outage.
- Alert severity and `for:` windows reduce noise.
- Alertmanager routes should be tested directly before relying on real alerts.

---

## Discord Alerting

- Discord webhooks are controlled by the webhook URL, not the Alertmanager receiver name.
- Webhook URLs should never be committed to GitHub.
- Local secret files and read-only container mounts keep alerting safer.
- Recreating a container may be required after changing volume mounts.

---

## Secure Remote Access

- Secure remote administration does not require public SSH exposure.
- Tailscale provides a clean private admin path.
- Remote access should be validated from outside the home network.
- RustDesk adds a practical remote support layer when kept LAN-only or VPN-only.

---

## Proxmox and Virtualization

- Moving infrastructure services off a gaming PC improves reliability.
- Docker Desktop is useful for testing, but Linux VM hosting is cleaner for always-on services.
- Proxmox makes service separation, backups, and future expansion easier.
- VM naming should match the actual role of the workload.
- Backups should be validated as part of the implementation, not treated as an afterthought.

---

## Docker Operations

- Docker container logs should have rotation configured.
- Prometheus retention should be limited to avoid uncontrolled disk growth.
- Monitoring services should not share a VM with experimental app workloads.
- Portainer Agent belongs on managed Docker hosts; Portainer Server can live on a separate app/admin VM later.
- Disk expansion should be followed by guest filesystem expansion and validation.

---

## RustDesk Remote Access

- RustDesk Server OSS can be self-hosted with lightweight resources.
- Key mismatch issues usually point to client/server key configuration problems.
- LAN-only firewalling is a safer first step than public exposure.
- Remote access tooling should be documented with screenshots and redacted IDs.

---

## Troubleshooting and Validation

- Small misconfigurations can affect the entire network.
- Layered troubleshooting works best: network → host → service → client path.
- Logs should be checked before assuming a tool or service is broken.
- Validation should prove normal operation, failure handling, monitoring, alerting, and remote access.

---

## Documentation Lessons

- Screenshots should prove configuration, status, and successful validation.
- Step-by-step docs should group commands with expected outcomes.
- Overview docs should focus on design intent and high-level proof.
- Consistent formatting makes a repo easier to review and present.
- Redacting secrets, tokens, passwords, and identifiers is part of the documentation process.

---

## Scope Control

- The project became broad enough that segmentation deserves its own repository.
- Closing this repo at the infrastructure foundation point keeps the project focused.
- The next project can build on this foundation without making this repository too large or unfocused.

---

## Personal Takeaways

- Building is one of the fastest ways to learn infrastructure.
- Real troubleshooting creates deeper understanding than theory alone.
- Documentation turns lab work into repeatable proof of skill.
- Each phase made the environment less like a basic home setup and more like a real infrastructure environment.
