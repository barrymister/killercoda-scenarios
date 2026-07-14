#!/bin/bash
apt-get install -y acl >/dev/null 2>&1 || true
useradd -m deploy >/dev/null 2>&1 || true
echo secret > /root/report.txt
