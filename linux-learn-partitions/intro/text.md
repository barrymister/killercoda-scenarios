# A disk needs a filesystem before it can hold files

Raw storage is just a stream of blocks. To store files on it you write a
**filesystem** (ext4, xfs, ...) onto it — that's the on-disk structure of inodes,
directories, and free-space maps. Then tools read the filesystem's **metadata**
to know what it is and how to mount it.

On a real machine you'd first carve the disk into partitions with `fdisk` or
`parted`, then run `mkfs.ext4 /dev/sdb1`. Here you'll practice the part that
matters most — `mkfs` and `blkid` — safely against a **file image** instead of a
real disk. A 128 MB image (`/root/disk.img`) is already waiting for you.

- `mkfs.ext4` — create an ext4 filesystem
- `blkid` — print a device's UUID and TYPE
- `file` — identify what a file contains
