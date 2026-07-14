#!/bin/bash
mkdir -p /root/proj/{logs,src}
printf 'x\n' > /root/proj/logs/old.log
dd if=/dev/zero of=/root/proj/logs/big.log bs=1M count=2 >/dev/null 2>&1
printf 'hi\n' > /root/proj/src/main.c
touch -d '10 days ago' /root/proj/logs/old.log
