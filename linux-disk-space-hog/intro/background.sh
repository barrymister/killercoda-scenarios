#!/bin/bash
mkdir -p /root/app/logs
# A large file appears — simulate the "who filled the disk?" hunt (safe: 300MB).
fallocate -l 300M /root/app/logs/debug.log 2>/dev/null || dd if=/dev/zero of=/root/app/logs/debug.log bs=1M count=300 >/dev/null 2>&1
echo "ok" > /root/app/app.conf
