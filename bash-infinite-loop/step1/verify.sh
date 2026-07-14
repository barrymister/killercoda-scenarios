#!/bin/bash
# The fixed script must terminate and print exactly counts 1..5.
out=$(timeout 5 bash /root/count.sh 2>/dev/null) || exit 1
[ "$(echo "$out" | grep -c '^count ')" -eq 5 ] && echo "$out" | grep -qx 'count 5'
