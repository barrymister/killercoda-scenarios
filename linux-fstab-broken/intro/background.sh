#!/bin/bash
fallocate -l 64M /root/data.img || dd if=/dev/zero of=/root/data.img bs=1M count=64
mkfs.ext4 -F /root/data.img >/dev/null 2>&1
mkdir -p /mnt/data
# The intended (correct) entry the learner should end up with is a loop mount of /root/data.img.
# Inject a broken entry referencing a device that does not exist, with no nofail:
echo '/dev/sdX9 /mnt/data ext4 defaults 0 2' >> /etc/fstab
