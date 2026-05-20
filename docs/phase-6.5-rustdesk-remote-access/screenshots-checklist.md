# Phase 6.5 Screenshot Checklist

## RustDesk / VM Hardening Screenshots

Screenshot folder:

~~~text
screenshots/phase-6.5/
~~~

Existing RustDesk screenshots remain part of this phase.

## Docker Management / Portainer Screenshots

Screenshot folder:

~~~text
screenshots/phase-6.5/docker-management-portainer/
~~~

| File | Description |
|---|---|
| `01-proxmox-docker-mgmt-vm-summary.png` | docker-mgmt VM summary |
| `02-proxmox-docker-mgmt-network-mac-address.png` | Proxmox virtual NIC MAC source |
| `03-docker-mgmt-dhcp-lease-validation.png` | docker-mgmt reserved IP validation |
| `04-docker-mgmt-network-validation.png` | Gateway, DNS, and internet validation |
| `05-docker-installed-validation.png` | Docker and Docker Compose validation |
| `06-portainer-server-running.png` | Portainer Server container running |
| `07-portainer-initial-login.png` | Portainer UI available |
| `08-docker-mgmt-ufw-status.png` | docker-mgmt firewall status |
| `09-portainer-agent-docker-monitoring-running.png` | Agent running on docker-monitoring |
| `10-docker-monitoring-agent-firewall-rule.png` | Agent firewall rule |
| `11-portainer-docker-monitoring-environment-online.png` | docker-monitoring online in Portainer |
| `12-portainer-monitoring-containers-visible.png` | Monitoring containers visible |
| `13-portainer-access-over-lan.png` | Portainer reachable over LAN |
| `14-portainer-access-over-tailscale-subnet-route.png` | Portainer reachable remotely over Tailscale |
| `15-proxmox-backup-docker-mgmt.png` | docker-mgmt backup completed |

## Blur Before Publishing

Blur:

- MAC addresses
- Portainer usernames or tokens
- Personal device names
- Any public IPs or auth URLs
