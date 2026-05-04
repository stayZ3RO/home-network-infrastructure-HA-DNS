# Config Examples ⚙️

This folder contains sanitized configuration examples and references used throughout the Home Network Infrastructure Lab.

These files are included for documentation and learning purposes.

---

## Config Purpose

Config examples help document:

- Service configuration patterns
- Monitoring configuration
- Alerting configuration
- DNS-related setup
- Container or service deployment references
- Sanitized infrastructure examples

---

## Security Rules

Do not commit:

- Passwords
- API tokens
- Discord webhook URLs
- Tailscale auth keys
- Private keys
- Real secrets
- Unredacted production configuration exports

Use placeholders or `.example` files when documenting sensitive configs.

---

## Related Areas

| Area | Purpose |
|---|---|
| Pi-hole | DNS filtering and local visibility |
| Keepalived | HA DNS VIP failover |
| Gravity Sync | Pi-hole rule replication |
| Unbound | Recursive DNS resolution |
| Prometheus | Metrics collection |
| Grafana | Dashboards |
| Alertmanager | Alert routing |
| RustDesk | Self-hosted remote access |
