#!/bin/bash
f=/etc/sudoers.d/deploy
[ -f "$f" ] || exit 1
grep -qE '^deploy[[:space:]].*ALL' "$f" && visudo -cf "$f" >/dev/null 2>&1
