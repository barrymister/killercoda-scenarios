# Mounting & fstab

`mount SRC DIR` attaches a filesystem to a directory, and `-o loop` lets you mount
a plain file image. Live mounts vanish on reboot — `/etc/fstab` makes them
persistent. Reference filesystems there by `UUID=` (stable) rather than
`/dev/sdX` (which can change when disks are added). `mount -a` mounts every fstab
entry at once. Each fstab line has six fields: device, mount point, filesystem
type, options, dump, and fsck-order.
