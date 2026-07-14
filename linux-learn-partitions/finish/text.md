# Filesystems & blkid

`fdisk` and `parted` carve a raw disk into partitions; `mkfs.ext4` /
`mkfs.xfs` write a filesystem onto a partition or image so it can hold files; and
`blkid` reads back the **UUID** and **TYPE** of any device. Those UUIDs matter:
`/etc/fstab` refers to filesystems by `UUID=` because a UUID never changes, while
device names like `/dev/sdb1` can shift when disks are added or reordered.
