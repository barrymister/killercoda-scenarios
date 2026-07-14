#!/bin/bash
grep -q 'set -euo pipefail' /root/safe.sh 2>/dev/null && grep -q 'trap cleanup EXIT' /root/safe.sh 2>/dev/null && bash /root/safe.sh >/dev/null 2>&1
