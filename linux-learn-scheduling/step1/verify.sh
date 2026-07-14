#!/bin/bash
crontab -l 2>/dev/null | grep -qE '^0 2 \* \* \* +/root/backup\.sh'
