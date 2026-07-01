#!/bin/bash
cd /root/repo || exit 1
[ "$(git symbolic-ref --short -q HEAD)" = "main" ] \
  && git show main:hotfix.txt >/dev/null 2>&1
