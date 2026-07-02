#!/bin/bash
[ -f /root/hello.out ] && grep -q "hello from slurm" /root/hello.out
