#!/bin/bash
git config --global user.email dev@thedevbench.test
git config --global user.name "Bench"
git config --global init.defaultBranch main
rm -rf /root/repo
mkdir -p /root/repo
cd /root/repo
git init -b main >/dev/null 2>&1
echo "v1" > notes.txt; git add notes.txt >/dev/null 2>&1; git commit -m "first note" >/dev/null 2>&1
echo "v2" >> notes.txt; git commit -am "second note" >/dev/null 2>&1
echo "v3" >> notes.txt; git commit -am "third note" >/dev/null 2>&1
rm -f /root/history.out
