# Mount the image, then make it persistent

Mount the image at `/mnt/data`. `-o loop` wraps the file in a loop device so the
kernel can mount it like a disk:

```
mount -o loop /root/data.img /mnt/data
```{{exec}}

Confirm it's mounted and write a test file to prove it's usable:

```
findmnt /mnt/data
df -h /mnt/data
echo "it works" > /mnt/data/test.txt
```{{exec}}

A live mount disappears on reboot. To make it permanent you'd look up the
filesystem's UUID and add an `/etc/fstab` entry (shown for reference — you don't
need to run this):

```
blkid -o value -s UUID /root/data.img
```{{exec}}

Then the fstab line — device, mount point, type, options, dump, fsck-order —
would be:

```
UUID=<uuid-from-above> /mnt/data ext4 defaults 0 2
```

`mount -a` mounts everything listed in fstab. Referring to the filesystem by
`UUID=` is safer than `/dev/sdX`, which can change between boots.

When `/mnt/data` is mounted, press **Check**.
