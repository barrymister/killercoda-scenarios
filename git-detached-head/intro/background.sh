#!/bin/bash
git config --global user.email dev@thedevbench.test
git config --global user.name "Bench"
git config --global init.defaultBranch main
rm -rf /root/repo
mkdir -p /root/repo
cd /root/repo
git init -b main >/dev/null 2>&1
echo "base" > app.txt; git add app.txt >/dev/null 2>&1; git commit -m "base" >/dev/null 2>&1
echo "more" >> app.txt; git commit -am "more" >/dev/null 2>&1
git checkout --detach >/dev/null 2>&1
echo "urgent fix" > hotfix.txt
git add hotfix.txt >/dev/null 2>&1
git commit -m "hotfix" >/dev/null 2>&1
