# A mount is missing and `mount -a` errors out

The `/mnt/data` filesystem should be mounted, but it isn't. Running `mount -a`
(which mounts everything listed in `/etc/fstab`) throws an error instead of
quietly succeeding.

On a real server this is dangerous: a bad `/etc/fstab` line is read at every
boot, and a failing entry can drop the machine into emergency mode before you
can even log in. Find the broken entry and fix it so `/mnt/data` mounts cleanly.

> The data lives in a loopback image file (`/root/data.img`) so this is safe to
> practise — no real disk required.
