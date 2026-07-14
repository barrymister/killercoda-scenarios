#!/bin/bash
bash /root/deploy.sh >/dev/null 2>&1 && grep -q 'deploying to /root/out' /root/out/log.txt 2>/dev/null
