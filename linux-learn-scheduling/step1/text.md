# Write a script, then schedule it with cron

Create a tiny backup script and make it executable:

```
cat > /root/backup.sh <<'SH'
#!/bin/bash
date >> /root/backup.log
SH
chmod +x /root/backup.sh
```{{exec}}

Add a cron line to run it every day at 02:00. The five fields are `min hour
day-of-month month day-of-week`; `*` means "every". This appends to any existing
crontab instead of overwriting it:

```
( crontab -l 2>/dev/null; echo '0 2 * * * /root/backup.sh' ) | crontab -
```{{exec}}

Confirm the job is installed:

```
crontab -l
```{{exec}}

The same schedule as a **systemd timer** would be a pair of units — you don't need
to create these, just see the modern equivalent:

```
cat <<'EOF'
# /etc/systemd/system/backup.service
[Service]
ExecStart=/root/backup.sh

# /etc/systemd/system/backup.timer
[Timer]
OnCalendar=*-*-* 02:00:00
[Install]
WantedBy=timers.target
EOF
```{{exec}}

When `crontab -l` shows the `0 2 * * * /root/backup.sh` line, press **Check**.
