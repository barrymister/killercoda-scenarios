#!/bin/bash
cat > /etc/systemd/system/bench.service <<'UNIT'
[Unit]
Description=Bench demo service
[Service]
ExecStart=/usr/local/bin/bench-daemon
Restart=no
[Install]
WantedBy=multi-user.target
UNIT
systemctl daemon-reload
systemctl enable bench.service >/dev/null 2>&1
systemctl start bench.service >/dev/null 2>&1 || true
