#!/bin/bash
fallocate -l 128M /root/data.img || dd if=/dev/zero of=/root/data.img bs=1M count=128
mkfs.ext4 -F /root/data.img
mkdir -p /mnt/data
