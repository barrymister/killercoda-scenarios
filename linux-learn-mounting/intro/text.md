# Mounting attaches a filesystem to the tree

A formatted filesystem is invisible until you **mount** it — graft it onto a
directory (its *mount point*) so its files appear there. `mount SRC DIR` does it
now; `/etc/fstab` does it automatically at every boot.

An already-formatted ext4 image (`/root/data.img`) and an empty mount point
(`/mnt/data`) are waiting. You'll mount the image with a **loop device** — the
kernel trick that lets a plain file be treated as a block device.

- `mount -o loop IMG DIR` — mount a file image
- `findmnt` / `df -h` — confirm what's mounted where
- `/etc/fstab` + `mount -a` — make mounts persistent, by UUID

You'll mount it live, then learn the fstab-by-UUID pattern that makes it stick.
