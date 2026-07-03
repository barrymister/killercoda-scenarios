#!/bin/bash
cd /root/lab || exit 1
[ -f main.json ] && grep -q "Microsoft.Storage/storageAccounts" main.json
