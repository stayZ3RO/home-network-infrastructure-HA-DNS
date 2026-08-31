# Project 2 Notes: VLAN-Aware Remote Access

The current `tailscale-router` advertises only the flat LAN subnet:

~~~text
192.168.68.0/24
~~~

This is correct for Project 1.

In the future managed infrastructure / VLAN project, remote access may be expanded or restricted per subnet.

## Future Considerations

Potential future subnet routing design may include:

| VLAN / Network Type | Remote Access Consideration |
|---|---|
| Management | Likely allowed only from trusted admin devices |
| Trusted clients | Optional |
| Lab/services | Likely useful for remote administration |
| IoT | Generally avoid advertising unless required |
| Guest | Do not advertise |

## Access Control

Future VLAN-aware remote access should be controlled with:

- ER605 firewall rules
- Tailscale route approval
- Tailscale ACLs
- Least-privilege remote access design

## Project Boundary

Project 1 does not advertise future VLANs.

VLAN design, inter-VLAN firewall policy, and SSID-to-VLAN mapping belong in the separate managed infrastructure project.
