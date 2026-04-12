Phase 3 Step-by-Step Guide
Overview

This phase adds high availability to DNS by introducing:

a second Pi-hole node
gravity-sync for synchronization
keepalived for failover
a jump box model for cleaner administration
Step 1: Prepare ashpi-2
Install Raspberry Pi OS
Set the hostname
Assign a static IP
Update the system
Verify network connectivity to ashpi-1

Example command:

sudo apt update && sudo apt upgrade -y
Step 2: Install Pi-hole on ashpi-2
Install Pi-hole on ashpi-2
Match the configuration to ashpi-1 as closely as possible
Confirm DNS is working locally on the second node
Step 3: Configure gravity-sync

Run the following on ashpi-1:

gravity-sync compare
gravity-sync test

Expected result:

both nodes communicate successfully
synchronization completes without errors
Step 4: Configure keepalived
Install keepalived on both nodes
Configure ashpi-1 as MASTER
Configure ashpi-2 as BACKUP
Assign the shared Virtual IP (VIP)
Start and enable the service on both nodes
Step 5: Verify VIP Assignment

Run:

ip a

Expected result:

the VIP appears on ashpi-1 while it is the active node
Step 6: Test Failover

On ashpi-1, stop keepalived:

sudo systemctl stop keepalived

Expected result:

the VIP moves to ashpi-2
DNS continues working through the secondary node

To restore normal state:

sudo systemctl start keepalived
Step 7: Add Jump Box Access

After high availability is working, improve administrative access by using ashpi-1 as the jump box.

Administrative flow:

main computer to ashpi-1
ashpi-1 to ashpi-2

See: Jump Box Access

Final Result

At the end of Phase 3, the environment provides:

* highly available DNS
* automatic failover
* synchronized Pi-hole configuration
* centralized SSH access through a jump box
