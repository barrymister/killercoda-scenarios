# Job scheduled correctly

A crontab line is `minute hour day-of-month month day-of-week command` — **five**
time fields, then the command. Miscount by one and cron silently treats a time
field as the start of the command, so the job never runs as intended. When a job
seems to not fire, check three things: the entry itself (`crontab -l`), that the
daemon is running (`systemctl is-active cron`), and cron's own log output
(`grep CRON /var/log/syslog`) to see whether it even tried.
