# Lessons Learned 🧠

## Network Foundation

- Bridge mode does not always disable WiFi automatically
- Double NAT can create inconsistent or misleading network behavior
- Router and gateway roles need to be clearly separated
- Planning IP structure early makes later expansion easier

---

## ISP and Edge Design

- Different ISPs handle passthrough and routing differently
- Xfinity supports true bridge mode
- AT&T requires IP Passthrough instead of traditional bridge mode
- Fiber introduces the ONT as an additional infrastructure layer
- Understanding the ISP handoff is critical before building internal services

---

## DNS and Pi-hole

- DNS must be enforced through DHCP to affect the full network
- Devices may need to reconnect or renew leases before DNS changes take effect
- Centralized DNS provides strong visibility into device and traffic behavior
- Pi-hole adds both control and observability, not just ad blocking

---

## High Availability DNS 🛡️

- A single Pi-hole instance still creates a single point of failure
- High availability requires both redundancy and validation
- Client simplicity matters, and a VIP helps by keeping one consistent DNS target
- Failover should be tested deliberately rather than assumed from configuration alone
- HA should be validated from the client perspective, not just from the node itself

---

## Gravity Sync 🔄

- Multiple Pi-hole nodes need synchronized configuration to behave consistently
- HA is weaker if local DNS records, blocklists, or settings drift between nodes
- Replication reduces manual effort and improves operational consistency
- Configuration sync is a core part of HA, not just a convenience feature

---

## keepalived and VIP Failover ⚖️

- The standby node must be fully functional before failover testing
- VIP movement alone is not enough; end-to-end DNS behavior also needs validation
- Service ownership, failover, and successful query resolution should be tested together
- HA should be validated from the client side to confirm real service continuity

---

## Recursive DNS with Unbound 🌐

- Running Unbound locally on each Pi-hole node removes reliance on third-party public upstream resolvers
- Each Pi-hole node should use its own local Unbound instance to avoid introducing a new internal single point of failure
- Recursive DNS should be tested both locally on each node and through the HA VIP path
- Adding Unbound completed the core DNS service layer before moving on to monitoring

---

## Monitoring and Alerting 📈

- Metrics collection and service probing solve different problems
- Node Exporter helps monitor host health, while Blackbox Exporter verifies service behavior from the outside
- Monitoring should observe the service path, not just whether the host is alive
- Healthy failover should not be treated as a service outage
- Alerting becomes more useful when warning, critical, and informational conditions are separated clearly
- `for:` windows reduce noise and help prevent flapping alerts
- Grafana dashboards are useful for visibility, while Alertmanager is better suited for routing and notification delivery
- Alertmanager routes should be tested directly before relying on production alert conditions
- A temporary Docker host can work well for monitoring, but long term a dedicated always-on management host is the better design

---

## Discord Alerting 🔔

- Discord webhooks are controlled by the webhook URL, not the Alertmanager receiver name
- The Alertmanager receiver name only needs to match the route configuration
- Webhook URLs should never be committed to GitHub
- Storing the webhook in a local secret file keeps the configuration safer and cleaner
- Mounting the secret into the container as read-only limits accidental modification
- Adding a new Docker volume mount requires recreating the container, not just restarting it
- Alertmanager logs are the fastest way to troubleshoot notification delivery failures
- Testing with a manual Alertmanager API alert is cleaner than breaking a real service first

---

## Secure Remote Access 🔐

- Secure remote administration does not require exposing SSH to the public internet
- A tailnet-based access path is cleaner than maintaining router port forwards
- Verifying remote access from outside the home network is more meaningful than only testing from inside the LAN
- Basic SSH over Tailscale is enough to establish a strong Phase 5 implementation without adding more complexity immediately
- Running Tailscale inside WSL is not necessary when the Windows host is already connected to the tailnet

---

## Troubleshooting and Validation 🧪

- Small misconfigurations can affect the behavior of the entire network
- Pi-hole gravity errors can often be resolved by rebuilding or reapplying list data
- Testing failure and recovery is just as important as testing the working state
- Layered troubleshooting works best: network → node → service → client path
- Validation needs to include normal operation, failover, monitoring behavior, alert delivery, and remote access
- Logs should be checked before assuming a tool or service is broken
- If a file exists on the host but not in a container, the issue is usually a volume mount or container recreation problem

---

## Documentation Lessons 📝

- Good screenshots should prove configuration, status, and successful validation
- Step-by-step guides are easier to follow when commands and outcomes stay grouped together
- Keeping the same documentation structure across phases makes the repo easier to read and present
- Screenshot-heavy walkthroughs should live in step-by-step or validation docs
- Overview docs should stay cleaner and only show high-level proof points
- Secrets, tokens, and webhook URLs should be redacted before screenshots are committed
- Writing documentation helps turn lab work into something repeatable and reviewable

---

## Infrastructure Thinking

- Systems should be built in layers: network → DNS → HA → monitoring → alerting → secure access
- Reducing single points of failure should be part of the design from the beginning
- Architecture decisions should support both resilience and operational simplicity
- Alerting should reflect real service impact, not just every individual component state
- Building first and refining later is often the fastest way to understand how infrastructure actually behaves

---

## Personal Takeaways

- Building is one of the fastest ways to learn infrastructure
- Real troubleshooting creates deeper understanding than theory alone
- Testing and documenting the work improves both technical knowledge and communication
- Each phase of the project made the lab feel less like a home setup and more like a real infrastructure environment
- Adding alerting and remote access made the lab more operational, not just functional
