# Docker Management & Portainer Visibility 🐳

![status](https://img.shields.io/badge/status-complete-brightgreen)
![scope](https://img.shields.io/badge/scope-docker_visibility-blue)
![platform](https://img.shields.io/badge/platform-Debian-lightgrey)
![tool](https://img.shields.io/badge/tool-Portainer-blue)

## Purpose

As part of final Project 1 cleanup, Docker visibility was centralized using Portainer.

The design separates Docker management from monitoring workloads. Portainer Server runs on its own dedicated VM, while the existing monitoring VM keeps its monitoring stack and only runs a Portainer Agent for visibility.

## Final Design

| VM | IP Address | Role |
|---|---:|---|
| `docker-mgmt` | `192.168.68.82` | Portainer Server only |
| `docker-monitoring` | `192.168.68.81` | Prometheus, Grafana, Alertmanager, Blackbox, Portainer Agent |
| `rustdesk-server` | `192.168.68.83` | RustDesk only |

## Design Rules

- Portainer Server runs only on `docker-mgmt`.
- Monitoring containers stay on `docker-monitoring`.
- Portainer Agent runs on Docker hosts that should be managed remotely.
- RustDesk remains isolated on its own VM.
- No public port forwarding is used.
- Portainer is accessed over LAN or through Tailscale subnet routing.

## docker-mgmt VM

| Setting | Value |
|---|---:|
| OS | Debian minimal |
| CPU | 1 vCPU |
| RAM | 1–2 GB |
| Disk | 16–20 GB |
| IP | `192.168.68.82` |
| Role | Portainer Server |

## Portainer Server

Portainer Server was deployed with Docker Compose.

~~~yaml
services:
  portainer:
    image: portainer/portainer-ce:lts
    container_name: portainer-server
    restart: unless-stopped
    ports:
      - "9443:9443"
    volumes:
      - portainer_data:/data
      - /var/run/docker.sock:/var/run/docker.sock

volumes:
  portainer_data:
~~~

Access URL:

~~~text
https://192.168.68.82:9443
~~~

## docker-monitoring Agent

The monitoring VM runs the existing monitoring stack and a Portainer Agent.

~~~yaml
services:
  portainer_agent:
    image: portainer/agent:lts
    container_name: portainer-agent
    restart: unless-stopped
    ports:
      - "9001:9001"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /var/lib/docker/volumes:/var/lib/docker/volumes
      - /:/host
~~~

Agent address used in Portainer:

~~~text
192.168.68.81:9001
~~~

## Firewall Notes

The Portainer Agent should only be reachable from the Portainer Server VM.

Example rule on `docker-monitoring`:

~~~bash
sudo ufw allow from 192.168.68.82 to any port 9001 proto tcp
~~~

## Validation

Validated:

- Portainer Server running on `docker-mgmt`
- Portainer Agent running on `docker-monitoring`
- `docker-monitoring` added as an environment in Portainer
- Monitoring containers visible from Portainer
- Portainer reachable over LAN
- Portainer reachable remotely through Tailscale subnet routing
- No public port forwarding required

## Outcome

Docker visibility is now centralized without mixing management, monitoring, and RustDesk responsibilities.
