#!/bin/bash
git config --global user.email dev@thedevbench.test
git config --global user.name "Bench"
git config --global init.defaultBranch main
rm -rf /root/repo
mkdir -p /root/repo
cd /root/repo
git init -b main >/dev/null 2>&1
printf 'title: Home\ncolor: blue\n' > site.txt
git add site.txt >/dev/null 2>&1; git commit -m "site" >/dev/null 2>&1
git switch -c feature >/dev/null 2>&1
printf 'title: Home\ncolor: green\n' > site.txt
git commit -am "feature: green" >/dev/null 2>&1
git switch main >/dev/null 2>&1
printf 'title: Home\ncolor: red\n' > site.txt
git commit -am "main: red" >/dev/null 2>&1
git merge feature >/dev/null 2>&1 || true
