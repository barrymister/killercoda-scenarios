#!/bin/bash
cd /root/repo || exit 1
! git show main:feature.txt >/dev/null 2>&1 \
  && git show feature:feature.txt >/dev/null 2>&1
