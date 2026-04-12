# Phase 3 — Step-by-Step Guide

## Goal

Upgrade DNS from a single Pi-hole node to a highly available DNS setup using:

* a second Pi-hole node
* Gravity Sync
* Keepalived
* a Virtual IP (VIP)

---

## Node Details

* `ashpi-1` → `192.168.68.60`
* `ashpi-2` → `192.168.68.61`
* VIP → `192.168.68.20`

---

## Step 1 — Prepare the Secondary Node

Flash and boot the second Raspberry Pi, then confirm it is reachable on the network.

### Validate

* `ashpi-2` is online
* static IP is set to `192.168.68.61`
* SSH works

### Screenshot

![Pi 2 Prep](../../screenshots/phase-3/step-01-pi2-prep.png)

---

## Step 2 — Install Pi-hole on ashpi-2

Install Pi-hole on the second node and confirm the dashboard loads.

### Validate

* Pi-hole admin page opens on `http://192.168.68.61/admin`
* dashboard loads without errors

### Screenshots

![Pi-hole Node 2 Dashboard](../../screenshots/phase-3/step-02-pi2-dashboard.png)

![Pi-hole Node 2 Queries](../../screenshots/phase-3/step-03-pi2-dashboard-queries.png)

---

## Step 3 — Generate SSH Key on ashpi-1

On `ashpi-1`, generate an SSH key for passwordless access to `ashpi-2`.

```bash
ssh-keygen -t ed25519
```

### Screenshot

![SSH Key Generation](../../screenshots/phase-3/step-04-keygen.png)

---

## Step 4 — Copy SSH Key to ashpi-2

From `ashpi-1`, copy the key to `ashpi-2`.

```bash
ssh-copy-id pi@192.168.68.61
```

### Screenshot

![Copy SSH Key](../../screenshots/phase-3/step-05-copy-key.png)

---

## Step 5 — Validate Passwordless SSH

Confirm `ashpi-1` can SSH into `ashpi-2` without a password prompt.

```bash
ssh pi@192.168.68.61
```

### Screenshot

![Passwordless SSH](../../screenshots/phase-3/step-06-passwordless-ssh.png)

---

## Step 6 — Install Gravity Sync

Install Gravity Sync on both nodes.

```bash
curl -sSL https://raw.githubusercontent.com/vmstan/gs-install/main/gs-install.sh | bash
```

---

## Step 7 — Configure Gravity Sync on ashpi-1

Configure `ashpi-1` as the source node and point it to `ashpi-2`.

```bash
gravity-sync config
```

Use:

* Remote host: `192.168.68.61`
* Remote user: `pi`

### Screenshot

![Gravity Sync Config](../../screenshots/phase-3/step-07-gravity-sync-config.png)

---

## Step 8 — Push Configuration to ashpi-2

Run the initial sync from `ashpi-1`.

```bash
gravity-sync push
```

### Screenshot

![Gravity Sync Push](../../screenshots/phase-3/step-08-gravity-sync-push.png)

---

## Step 9 — Compare Both Nodes

Confirm that the nodes are in sync.

```bash
gravity-sync compare
```

A successful result may show that no replication is required.

### Screenshot

![Gravity Sync Compare](../../screenshots/phase-3/step-09-gravity-sync-compare.png)

---

## Step 10 — Install Keepalived

Install Keepalived on both nodes.

```bash
sudo apt install keepalived -y
```

---

## Step 11 — Configure Keepalived on ashpi-1

Edit the Keepalived configuration on `ashpi-1`.

```bash
sudo nano /etc/keepalived/keepalived.conf
```

Use:

```conf
vrrp_instance VI_1 {
    state MASTER
    interface eth0
    virtual_router_id 51
    priority 100
    advert_int 1

    authentication {
        auth_type PASS
        auth_pass dnsfailover
    }

    virtual_ipaddress {
        192.168.68.20
    }
}
```

### Screenshot

![Keepalived Primary Config](../../screenshots/phase-3/step-10-keepalived-primary-config.png)

---

## Step 12 — Configure Keepalived on ashpi-2

Edit the Keepalived configuration on `ashpi-2`.

```bash
sudo nano /etc/keepalived/keepalived.conf
```

Use:

```conf
vrrp_instance VI_1 {
    state BACKUP
    interface eth0
    virtual_router_id 51
    priority 90
    advert_int 1

    authentication {
        auth_type PASS
        auth_pass dnsfailover
    }

    virtual_ipaddress {
        192.168.68.20
    }
}
```

### Screenshot

![Keepalived Secondary Config](../../screenshots/phase-3/step-11-keepalived-secondary-config.png)

---

## Step 13 — Start Keepalived

Enable and start Keepalived on both nodes.

```bash
sudo systemctl enable keepalived
sudo systemctl start keepalived
```

---

## Step 14 — Confirm VIP on ashpi-1

Check that the VIP is assigned to the primary node.

```bash
ip a
sudo systemctl status keepalived
```

Look for:

* `192.168.68.20/32`
* service status `active (running)`

### Screenshots

![VIP Assigned to Primary](../../screenshots/phase-3/step-12-vip-assigned-primary.png)

![VIP Active on Primary](../../screenshots/phase-3/step-13-vip-active-primary-status.png)

---

## Step 15 — Perform Failover Test

On `ashpi-1`, simulate failure by stopping Keepalived.

```bash
sudo systemctl stop keepalived
```

Then on `ashpi-2`, run:

```bash
ip a
sudo systemctl status keepalived
```

Confirm the VIP moved to `ashpi-2`.

### Screenshots

![Before Failover](../../screenshots/phase-3/step-14-before-failover.png)

![Failover Triggered](../../screenshots/phase-3/step-15-trigger-failover.png)

![After Failover on Secondary](../../screenshots/phase-3/step-16-after-failover-secondary.png)

---

## Step 16 — Update Router DNS

After validating failover, update Deco DNS to use the VIP instead of a single Pi-hole node.

Use:

* DNS → `192.168.68.20`

---

## Result

At the end of this phase:

* both Pi-hole nodes are deployed
* config replication is working
* VIP failover is working
* DNS is highly available
