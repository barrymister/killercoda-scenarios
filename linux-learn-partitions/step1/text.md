# Format the image, then read its metadata

Write an ext4 filesystem onto the image. `-F` forces `mkfs` to proceed on a plain
file (it normally expects a block device):

```
mkfs.ext4 -F /root/disk.img
```{{exec}}

Now read the filesystem's metadata. `blkid` reports the **UUID** (a stable unique
ID) and the **TYPE** — this is exactly how the system identifies filesystems:

```
blkid /root/disk.img
```{{exec}}

And confirm what the file now contains from the outside:

```
file /root/disk.img
```{{exec}}

On a real disk the flow would be: `fdisk /dev/sdb` (or `parted`) to create a
partition, then `mkfs.ext4 /dev/sdb1` to format it. The file image lets you
rehearse the `mkfs`/`blkid` half without touching real hardware.

When `blkid` reports `TYPE="ext4"`, press **Check**.
