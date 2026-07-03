#!/bin/bash
cd /root/lab || exit 1
[ -f main.tf ] || exit 1
terraform validate >/dev/null 2>&1
