# systemd runs your services

On modern Linux, `systemd` starts, stops, and supervises long-running programs.
Each service is described by a **unit file** (`/etc/systemd/system/NAME.service`).

You control units with `systemctl`:

- `systemctl start NAME` — run it now
- `systemctl enable NAME` — start it automatically on boot
- `systemctl status NAME` — is it running? recent logs
- `systemctl daemon-reload` — re-read unit files after you edit them

A tiny program (`/usr/local/bin/bench-daemon`) is already on the box. You'll wrap
it in a service unit, then enable and start it in one command.
