# Read the error, find the bad line, fix it

First, reproduce the failure. `mount -a` is safe to re-run — it only mounts
what isn't already mounted:

```
mount -a
```{{exec}}

Read the error. It complains about a device for `/mnt/data`. Now look at the
table it's reading from:

```
cat /etc/fstab
```{{exec}}

Spot the offending line — it points at `/dev/sdX9`, a device that doesn't exist
on this box. Confirm the *real* source of the data, the image file, and that it
holds an ext4 filesystem:

```
ls -l /root/data.img
blkid /root/data.img
```{{exec}}

The fix: replace the bogus entry so `/mnt/data` mounts the image as a loop
device. Remove the `/dev/sdX9` line and add a correct one in a single pass:

```
sed -i '\#/mnt/data#d' /etc/fstab
echo '/root/data.img /mnt/data ext4 loop,nofail 0 2' >> /etc/fstab
cat /etc/fstab
```{{exec}}

`loop` tells mount to attach the image file as a loopback block device.
`nofail` is a safety option: if the source is ever missing, boot degrades
gracefully instead of dropping into emergency mode.

Now mount everything and confirm `/mnt/data` is live:

```
mount -a
findmnt /mnt/data
```{{exec}}

When `mount -a` succeeds and `findmnt` shows `/mnt/data`, press **Check**.
