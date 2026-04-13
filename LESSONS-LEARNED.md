# Lessons Learned 🧠

## Network Foundation

* Bridge mode does not always disable WiFi automatically
* Double NAT can create inconsistent or misleading network behavior
* Router and gateway roles need to be clearly separated
* Planning IP structure early makes later expansion easier

---

## ISP and Edge Design

* Different ISPs handle passthrough and routing differently
* Xfinity supports true bridge mode
* AT&T requires IP Passthrough instead of traditional bridge mode
* Fiber introduces the ONT as an additional infrastructure layer
* Understanding the ISP handoff is critical before building internal services

---

## DNS and Pi-hole

* DNS must be enforced through DHCP to affect the full network
* Devices may need to reconnect or renew leases before DNS changes take effect
* Centralized DNS provides strong visibility into device and traffic behavior
* Pi-hole adds both control and observability, not just ad blocking

---

## High Availability DNS 🛡️

* A single Pi-hole instance still creates a single point of failure
* High availability requires both redundancy and validation
* Client simplicity matters, and a VIP helps by keeping one consistent DNS target
* Failover should be tested deliberately rather than assumed from configuration alone

---

## Gravity Sync 🔄

* Multiple Pi-hole nodes need synchronized configuration to behave consistently
* HA is weaker if local DNS records, blocklists, or settings drift between nodes
* Replication reduces manual effort and improves operational consistency
* Configuration sync is a core part of HA, not just a convenience feature

---

## keepalived and VIP Failover ⚖️

* The standby node must be fully functional before failover testing
* VIP movement alone is not enough; end-to-end DNS behavior also needs validation
* Service ownership, failover, and successful query resolution should be tested together
* HA should be validated from the client perspective, not just from the node itself

---

## Recursive DNS with Unbound 🌐

* Running Unbound locally on each Pi-hole node removes reliance on third-party public upstream resolvers
* Each Pi-hole node should use its own local Unbound instance to avoid introducing a new internal single point of failure
* Recursive DNS should be tested both locally on each node and through the HA VIP path
* Adding Unbound completed the core DNS service layer before moving on to monitoring

---

## Monitoring and Alerting 📈

* Metrics collection and service probing solve different problems
* Node Exporter helps monitor host health, while Blackbox Exporter verifies service behavior from the outside
* Monitoring should observe the service path, not just whether the host is alive
* Healthy failover should not be treated as a service outage
* Alerting becomes more useful when warning, critical, and informational conditions are separated clearly
* `for:` windows reduce noise and help prevent flapping alerts
* A temporary gaming PC can work well as a monitoring host, but long term a dedicated always-on system is the better design

---

## Troubleshooting and Validation 🧪

* Small misconfigurations can affect the behavior of the entire network
* Pi-hole gravity errors can often be resolved by rebuilding or reapplying list data
* Testing failure and recovery is just as important as testing the working state
* Layered troubleshooting works best: network → node → service → client path
* Validation needs to include normal operation, failover, and restoration

---

## Documentation Lessons 📝

* Good screenshots should prove configuration, status, and successful validation
* Step-by-step guides are easier to follow when commands and outcomes stay grouped together
* Keeping the same documentation structure across phases makes the repo easier to read and present
* Writing documentation helps turn lab work into something that is repeatable and reviewable

---

## Infrastructure Thinking

* Systems should be built in layers: network → DNS → HA → monitoring → secure access
* Reducing single points of failure should be part of the design from the beginning
* Architecture decisions should support both resilience and operational simplicity
* Building first and refining later is often the fastest way to understand how infrastructure actually behaves

---

## Personal Takeaways

* Building is one of the fastest ways to learn infrastructure
* Real troubleshooting creates deeper understanding than theory alone
* Testing and documenting the work improves both technical knowledge and communication
* Each phase of the project made the lab feel less like a home setup and more like a real infrastructure environment
