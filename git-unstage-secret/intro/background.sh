#!/bin/bash
git config --global user.email dev@thedevbench.test
git config --global user.name "Bench"
git config --global init.defaultBranch main
rm -rf /root/repo
mkdir -p /root/repo
cd /root/repo
git init -b main >/dev/null 2>&1
echo "# app" > README.md
echo "API_KEY=super-secret-value" > .env
git add -A >/dev/null 2>&1
