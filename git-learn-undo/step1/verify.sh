#!/bin/bash
[ -z "$(git -C /root/repo status --porcelain)" ] && grep -qx "good content" /root/repo/config.txt
