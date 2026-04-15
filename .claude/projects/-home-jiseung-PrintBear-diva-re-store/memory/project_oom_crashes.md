---
name: OOM crashes when running dtestb
description: System crashes (slowdown → freeze → GDM login screen) caused by OOM when running dtestb alongside Chrome and Next.js
type: project
---

System crashes under heavy load are caused by OOM (Out of Memory), not NVIDIA/GPU issues.

**Why:** Running `dtestb` (heavy Docker test command) while Chrome (~6GB+) and Next.js dev server (~3.6GB) are open exhausts all 32GB RAM + 8GB swap. systemd-oomd kills the session, landing on the GDM login screen.

**What was tried:** Chrome Memory Saver set to "balanced" on 2026-04-08. Waiting to see if this is enough.

**How to apply:** If the crash happens again, pick up with one of these next steps:
- **Option A:** Cap Docker memory for `dtestb` (need to check if it uses docker-compose or raw docker run)
- **Option B:** Configure systemd-oomd to kill apps (Chrome first) instead of the whole session
- **Option C:** Enable zram for faster in-memory swap to reduce the freeze severity

There is also a separate, unrelated issue: NVIDIA DKMS build failure for kernel 6.17 (`nvidia-dkms-575-open 575.51.03`). The 6.14 kernel + NVIDIA driver are working fine. The DKMS failure will keep triggering apport dialogs after kernel/NVIDIA package updates until fixed.
