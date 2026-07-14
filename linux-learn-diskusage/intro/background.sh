#!/bin/bash
mkdir -p /var/lib/benchbig
fallocate -l 40M /var/lib/benchbig/blob.bin || dd if=/dev/zero of=/var/lib/benchbig/blob.bin bs=1M count=40
