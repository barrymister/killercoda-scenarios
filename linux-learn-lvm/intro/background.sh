#!/bin/bash
apt-get install -y lvm2 >/dev/null 2>&1
for n in 1 2; do
  fallocate -l 256M /root/pv$n.img || dd if=/dev/zero of=/root/pv$n.img bs=1M count=256
  losetup -f /root/pv$n.img
done
losetup -a
