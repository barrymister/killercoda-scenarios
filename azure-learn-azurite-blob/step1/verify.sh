#!/bin/bash
cd /root/lab || exit 1
source conn.env 2>/dev/null || exit 1
az storage blob list --container-name data --connection-string "$AZ_CONN" \
  --query "[].name" -o tsv 2>/dev/null | grep -q "hello.txt"
