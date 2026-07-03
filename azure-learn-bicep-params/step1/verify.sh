#!/bin/bash
cd /root/lab || exit 1
[ -f main.bicep ] || exit 1
grep -q "@secure()" main.bicep || exit 1
grep -Eq "^param " main.bicep || exit 1
az bicep build -f main.bicep >/dev/null 2>&1 || exit 1
[ -f main.json ]
