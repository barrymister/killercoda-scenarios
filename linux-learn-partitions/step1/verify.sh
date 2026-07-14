#!/bin/bash
blkid -o value -s TYPE /root/disk.img 2>/dev/null | grep -q '^ext4$'
