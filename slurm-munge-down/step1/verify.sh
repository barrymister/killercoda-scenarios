#!/bin/bash
# munge must be usable and slurm commands must succeed
munge -n 2>/dev/null | unmunge >/dev/null 2>&1 && sinfo >/dev/null 2>&1
