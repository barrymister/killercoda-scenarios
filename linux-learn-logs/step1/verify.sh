#!/bin/bash
f=/etc/logrotate.d/benchapp
[ -f "$f" ] || exit 1
grep -q 'daily' "$f" && grep -qE 'rotate[[:space:]]+7' "$f" && logrotate -d "$f" >/dev/null 2>&1
