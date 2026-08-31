# Phase 4 Monitoring Configs 📁

This folder contains sanitized configuration files used for Phase 4 monitoring and alerting.

## Included configs

- `docker-compose.yml`
- `prometheus.yml`
- `alert.rules.yml`
- `alertmanager.yml`
- `blackbox.yml`
- Grafana datasource provisioning
- exported Grafana dashboards

## Notes

- The Grafana admin password in `docker-compose.yml` has been sanitized and replaced with `CHANGE_ME`.
- Internal lab IPs are left intact because they reflect the private LAN design of the homelab.
- These files represent the working Phase 4 monitoring stack used in the lab.

## Monitored endpoints

- `ashpi-1`, `192.168.68.60`
- `ashpi-2`, `192.168.68.61`
- HA DNS VIP, `192.168.68.20`
