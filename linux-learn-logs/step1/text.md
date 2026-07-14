# Query journald, then configure logrotate

Read logs from this boot:

```
journalctl -b --no-pager | tail
```{{exec}}

Filter to errors only with `-p err`, and to a time window with `--since`:

```
journalctl -p err -b --no-pager
journalctl --since '1 hour ago' --no-pager | tail
```{{exec}}

Now write a logrotate policy for the app log. `daily` rotates once a day,
`rotate 7` keeps seven old copies, `compress` gzips them, `missingok` skips
quietly if the file is absent, and `notifempty` won't rotate an empty file:

```
cat > /etc/logrotate.d/benchapp <<'EOF'
/var/log/benchapp.log {
    daily
    rotate 7
    compress
    missingok
    notifempty
}
EOF
```{{exec}}

Validate the config with a dry run — `-d` reports what it would do and changes
nothing:

```
logrotate -d /etc/logrotate.d/benchapp
```{{exec}}

When `/etc/logrotate.d/benchapp` exists with `daily` and `rotate 7` and the dry
run succeeds, press **Check**.
