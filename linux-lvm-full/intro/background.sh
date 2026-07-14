#!/bin/bash
apt-get install -y lvm2 >/dev/null 2>&1
fallocate -l 512M /root/pv.img || dd if=/dev/zero of=/root/pv.img bs=1M count=512
LOOP=$(losetup -f)
losetup "$LOOP" /root/pv.img
pvcreate -y "$LOOP" >/dev/null 2>&1
vgcreate appvg "$LOOP" >/dev/null 2>&1
lvcreate -L 100M -n app appvg >/dev/null 2>&1
mkfs.ext4 -F /dev/appvg/app >/dev/null 2>&1
mkdir -p /mnt/app
mount /dev/appvg/app /mnt/app
# Fill it so it's genuinely out of space:
dd if=/dev/zero of=/mnt/app/fill.bin bs=1M count=90 >/dev/null 2>&1 || true
