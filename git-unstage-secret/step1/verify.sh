#!/bin/bash
cd /root/repo || exit 1
! git ls-files --error-unmatch .env >/dev/null 2>&1 \
  && git check-ignore -q .env \
  && [ -f .env ]
