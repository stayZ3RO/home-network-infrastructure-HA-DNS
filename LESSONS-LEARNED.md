# Lessons Learned

## Network Control

* Bridge mode does not always disable WiFi
* Double NAT can cause unexpected behavior
* Router vs gateway roles must be clearly separated

---

## ISP Differences

* Xfinity supports true bridge mode
* AT&T requires IP Passthrough instead
* Fiber introduces ONT as an additional layer

---

## DNS & Pi-hole

* DNS must be enforced via DHCP to affect all devices
* Devices may require reconnection to adopt DNS changes
* Centralized DNS provides powerful visibility

---

## Troubleshooting

* Small misconfigurations can affect entire network behavior
* Pi-hole gravity errors can be resolved by rebuilding lists
* Testing (fail/restore) is critical for validation

---

## Infrastructure Thinking

* Systems should be layered (network → DNS → services)
* Reducing single points of failure is essential
* Planning IP structure early simplifies scaling

---

## Personal Takeaways

* Building is the best way to learn infrastructure
* Real-world troubleshooting builds deeper understanding than theory
* Documentation reinforces knowledge and improves clarity
