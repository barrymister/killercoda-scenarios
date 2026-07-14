#!/bin/bash
f=/root/bench.nft
[ -f "$f" ] || exit 1
grep -q 'policy drop' "$f" && grep -qE 'tcp dport 22' "$f" && nft -c -f "$f" >/dev/null 2>&1
