#!/bin/bash
# node must be in a schedulable state, not drained/down
state=$(sinfo -h -o "%T" 2>/dev/null | tr '\n' ' ')
echo "$state" | grep -qE "idle|mixed|alloc" && ! echo "$state" | grep -qiE "drain|down"
