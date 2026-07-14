# Wrap a program in a service

Write a unit file. `Type=simple` means the program stays in the foreground and
systemd tracks it directly:

```
cat > /etc/systemd/system/bench.service <<'UNIT'
[Unit]
Description=Bench demo daemon

[Service]
ExecStart=/usr/local/bin/bench-daemon
Restart=on-failure

[Install]
WantedBy=multi-user.target
UNIT
```{{exec}}

Re-read units, then **enable and start** in one shot with `--now`:

```
systemctl daemon-reload
systemctl enable --now bench.service
```{{exec}}

Confirm it's both running and set to start on boot:

```
systemctl is-active bench.service
systemctl is-enabled bench.service
systemctl status bench.service --no-pager
```{{exec}}

When `is-active` says `active` and `is-enabled` says `enabled`, press **Check**.
