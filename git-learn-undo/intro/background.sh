#!/bin/bash
git config --global user.email dev@thedevbench.test
git config --global user.name "Bench"
git config --global init.defaultBranch main
rm -rf /root/repo
mkdir -p /root/repo
cd /root/repo
git init -b main >/dev/null 2>&1
echo "good content" > config.txt
git add config.txt >/dev/null 2>&1
git commit -m "add config" >/dev/null 2>&1
