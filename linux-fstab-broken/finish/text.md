# fstab fixed

A bad `/etc/fstab` line is a classic boot-blocker: it's read on every boot, and
a failing entry can leave the machine in emergency mode before you can log in.

The triage:

- `mount -a` reproduces the failure safely (it only mounts what isn't already
  mounted) and prints the exact line that's broken.
- `cat /etc/fstab` shows the table; `findmnt --verify` cross-checks every entry
  against reality and flags problems without touching anything.
- `blkid` / `ls -l` confirm the real source before you edit.

Two habits that prevent this class of outage:

- **Refer to filesystems by `UUID=`** (from `blkid`) instead of kernel device
  names like `/dev/sdX` — device names can shift between boots, UUIDs don't.
- **Add `nofail`** so a missing disk degrades gracefully instead of blocking
  boot. `nofail` plus `x-systemd.device-timeout=` is the belt-and-braces combo
  on systemd hosts.
