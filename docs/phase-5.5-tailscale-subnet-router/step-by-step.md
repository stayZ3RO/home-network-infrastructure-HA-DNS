# Phase 5.5 Step-by-Step: Tailscale Subnet Router

## 1. VM Creation

A lightweight Debian VM was created in Proxmox.

| Setting | Value |
|---|---:|
| VM name | `tailscale-router` |
| OS | Debian minimal |
| CPU | 1 vCPU |
| RAM | 512 MB–1 GB |
| Disk | 8–12 GB |
| Network | VirtIO on `vmbr0` |
| IP | `192.168.68.84` |

The VM was built without a desktop environment.

## 2. IP Assignment

The VM uses DHCP with a reserved LAN address.

| Device | IP Address | Assignment Method |
|---|---:|---|
| `tailscale-router` | `192.168.68.84` | DHCP reservation using Proxmox virtual NIC MAC |

The VM remains configured for DHCP inside Debian. The reserved address is assigned by the gateway using the virtual NIC MAC address from Proxmox.

The gateway reservation UI is intentionally not included in Project 1 documentation because the current managed gateway view belongs to the later managed-router cutover state. Project 1 documents the Proxmox MAC source and Debian DHCP lease validation instead.

## 3. Baseline Packages

Baseline tools were installed:

~~~bash
sudo apt update
sudo apt install -y sudo curl ca-certificates ufw qemu-guest-agent vim mc screen
~~~

## 4. Tailscale Installation

Tailscale was installed on the VM:

~~~bash
curl -fsSL https://tailscale.com/install.sh | sh
~~~

## 5. IPv4 Forwarding

IPv4 forwarding was enabled so the VM can route traffic between Tailscale and the LAN.

~~~bash
echo 'net.ipv4.ip_forward = 1' | sudo tee /etc/sysctl.d/99-tailscale-subnet-router.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale-subnet-router.conf
~~~

Validation:

~~~bash
sysctl net.ipv4.ip_forward
~~~

Expected result:

~~~text
net.ipv4.ip_forward = 1
~~~

## 6. LAN Route Advertisement

The LAN subnet was advertised into Tailscale:

~~~bash
sudo tailscale up \
  --hostname=tailscale-router \
  --advertise-routes=192.168.68.0/24 \
  --accept-dns=false
~~~

The route was then approved in the Tailscale admin console.

## 7. UFW Rules

The VM firewall was configured to allow SSH from trusted paths and route traffic from Tailscale into the LAN.

~~~bash
LAN_IF=$(ip route | awk '/default/ {print $5; exit}')

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow from 192.168.68.0/24 to any port 22 proto tcp
sudo ufw allow in on tailscale0 to any port 22 proto tcp

sudo ufw route allow in on tailscale0 out on "$LAN_IF" to 192.168.68.0/24

sudo ufw enable
sudo ufw status verbose
~~~

## 8. Client Route Use

Trusted clients were configured to accept/use Tailscale subnet routes.

Tested clients included:

- Laptop
- Phone
- Remote Tailscale client device

## 9. Backup

After validation, the VM was set to start at boot and backed up in Proxmox.
