# Read the crontab, count the fields

Start by looking at what's actually scheduled:

```
crontab -l
```{{exec}}

You'll see something like `*/1 * * * /root/beat.sh`. A cron schedule needs
**five** time fields before the command:

```
minute  hour  day-of-month  month  day-of-week   command
```

Count them on that line: `*/1  *  *  *` is only **four** — cron reads the fourth
`*` as the command, mangling the entry so it never runs the script.

Also make sure the cron daemon itself is up:

```
systemctl is-active cron || service cron status
```{{exec}}

Now fix the crontab so it has five proper time fields (every minute) followed by
the script:

```
( echo '* * * * * /root/beat.sh' ) | crontab -
crontab -l
```{{exec}}

The line should now read `* * * * * /root/beat.sh`. Cron logs its activity — you
can watch jobs fire with `grep CRON /var/log/syslog`.

Once `crontab -l` shows five `*` fields before the script, press **Check**.
