#!/bin/bash
cd /root/repo || exit 1
! git rev-parse -q --verify MERGE_HEAD >/dev/null 2>&1 \
  && ! grep -q '<<<<<<<' site.txt \
  && grep -q 'color: green' site.txt
