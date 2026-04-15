---
name: iPhone local dev setup
description: How to access http://dev.stickermule.com from iPhone for testing
type: project
---

## iPhone Local Dev Testing Setup

The dev site runs on the local machine at `192.168.68.54` (LAN IP). `dev.stickermule.com` resolves to `127.0.0.1` in `/etc/hosts`, so the iPhone needs a local DNS server to resolve it correctly.

### Solution: dnsmasq on the Linux machine

Installed dnsmasq and configured it to:
- Listen on the LAN IP (`192.168.68.54`)
- Return `192.168.68.54` for `dev.stickermule.com` and `dev.stickermule.net`
- Use `local=` directive to prevent forwarding those domains upstream (critical — without this, Safari gets the real HTTPS DNS record pointing to production AWS and connects there instead of locally)
- Forward all other DNS queries to Google DNS (8.8.8.8, 8.8.4.4)

Config file: `/etc/dnsmasq.d/local.conf`
```
listen-address=192.168.68.54
bind-interfaces
no-hosts
server=8.8.8.8
server=8.8.4.4
local=/dev.stickermule.com/
local=/dev.stickermule.net/
address=/dev.stickermule.com/192.168.68.54
address=/dev.stickermule.net/192.168.68.54
```

### iPhone setup
- Settings → WiFi → network → Configure DNS → Manual → `192.168.68.54` only (remove NordVPN's DNS servers 202.58.203.x)
- Settings → Apps → Safari → Pop-ups → disable "Block Pop-ups" (needed for Google Sign In)
- Toggle airplane mode after changing DNS to flush iOS DNS cache

### Key gotchas
- `no-hosts` is required — without it, dnsmasq reads `/etc/hosts` which has `127.0.0.1` for dev.stickermule.com, overriding the `address=` directive
- `local=/dev.stickermule.com/` is critical — Safari on iOS queries HTTPS DNS records in addition to A records. Without this, dnsmasq forwards the HTTPS query upstream and returns the real production AWS ELB, causing Safari to connect to production instead of local
- Chrome on iOS uses DNS-over-HTTPS (DoH) which bypasses custom DNS — disable in chrome://settings/security
- NordVPN injects its own DNS servers (202.58.203.202/203) into iPhone WiFi settings when active — these take priority and must be removed
- Toggle airplane mode to flush iOS DNS cache whenever DNS config changes
- Port 80 and 443 on the dev machine are bound to `0.0.0.0` so the iPhone can reach them directly
