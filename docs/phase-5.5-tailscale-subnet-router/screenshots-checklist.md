# Phase 5.5 Screenshot Checklist

Screenshot folder:

~~~text
screenshots/phase-5.5-tailscale-subnet-router/
~~~

## Required Screenshots

| File | Description |
|---|---|
| `01-proxmox-vm-created-summary.png` | tailscale-router VM summary |
| `02-proxmox-vm-network-mac-address.png` | Proxmox virtual NIC MAC source |
| `03-debian-dhcp-lease-validation.png` | Debian showing reserved IP |
| `04-debian-network-validation.png` | Gateway, DNS, and internet validation |
| `05-tailscale-installed-service-running.png` | Tailscale service running |
| `06-ip-forwarding-enabled.png` | IPv4 forwarding enabled |
| `07-tailscale-route-advertised-cli.png` | LAN route advertised from CLI |
| `08-tailscale-admin-route-approved.png` | Route approved in Tailscale admin |
| `09-ufw-status-tailscale-router.png` | UFW status and routing rules |
| `10-local-lan-validation-from-subnet-router.png` | Local LAN ping validation |
| `11-client-accept-routes-enabled.png` | Client route acceptance |
| `12-remote-pihole-vip-over-tailscale.png` | Pi-hole reachable remotely |
| `13-remote-proxmox-ui-over-lan-ip.png` | Proxmox reachable remotely |
| `14-remote-grafana-ui-over-lan-ip.png` | Grafana reachable remotely |
| `15-remote-management-ui-access-over-tailscale.png` | Management UI reachable remotely |
| `16-rustdesk-lan-ip-config-over-subnet-route.png` | RustDesk using LAN IP config |
| `17-proxmox-start-at-boot-enabled.png` | Start at boot enabled |
| `18-proxmox-backup-tailscale-router.png` | Proxmox backup completed |

## Blur Before Publishing

Blur:

- Tailscale account email
- Tailscale auth URLs
- Public IPs
- MAC addresses
- RustDesk IDs
- Personal device names if needed
