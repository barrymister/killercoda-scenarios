#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
mkdir -p /root/lab
if ! command -v az >/dev/null 2>&1; then
  curl -sL https://aka.ms/InstallAzureCLIDeb | bash >/dev/null 2>&1 || true
fi
: > /root/lab/answers.sh
touch /root/.lab-ready
