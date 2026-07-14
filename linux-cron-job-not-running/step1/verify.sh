#!/bin/bash
crontab -l 2>/dev/null | grep -qE '^\*([[:space:]]+\*){4}[[:space:]]+/root/beat\.sh'
