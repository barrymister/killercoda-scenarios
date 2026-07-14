# Confirm the shortage, find the headroom, grow it live

Start with the symptom. How full is the mount?

```
df -h /mnt/app
```{{exec}}

It's at (or near) 100%. Before deleting anything, ask the LVM question: does the
volume group have free space you can hand to this volume? Check the VG summary
and the free extents:

```
vgs
vgdisplay appvg | grep -i free
```{{exec}}

`Free PE / Size` and `VFree` show unallocated space in `appvg` — this VG was
built with plenty of room. So the fix isn't to delete data, it's to give the
logical volume more of the space that's already sitting idle in the group.

Extend the logical volume and grow its filesystem in a single command:

```
lvextend -L +300M -r /dev/appvg/app
```{{exec}}

The `-r` (`--resizefs`) flag is the key: it resizes the filesystem to match the
new volume size right after extending it (calling `resize2fs` under the hood for
ext4). Without `-r` you'd enlarge the logical volume, but the filesystem inside
it wouldn't know about the extra space — `df` would still show it full.

Confirm the mount now has room:

```
df -h /mnt/app
lvs appvg/app
```{{exec}}

When `/mnt/app` shows more space and the LV is larger than its original 100M,
press **Check**.
