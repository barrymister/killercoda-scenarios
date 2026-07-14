#!/bin/bash
fallocate -l 128M /root/disk.img || dd if=/dev/zero of=/root/disk.img bs=1M count=128
