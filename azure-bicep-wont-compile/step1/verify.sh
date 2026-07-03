#!/bin/bash
cd /root/lab || exit 1
az bicep build -f main.bicep >/dev/null 2>&1 || exit 1
[ -f main.json ] && grep -q "Microsoft.Storage/storageAccounts" main.json
