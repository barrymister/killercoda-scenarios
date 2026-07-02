#!/bin/bash
# slurmd process alive AND node schedulable AND a job can run
pgrep -x slurmd >/dev/null 2>&1 || systemctl is-active --quiet slurmd 2>/dev/null || exit 1
srun -t 1 hostname >/dev/null 2>&1
