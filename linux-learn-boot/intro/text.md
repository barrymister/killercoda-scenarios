# What systemd boots into

On boot, `systemd` brings the system up to a **target** — a named group of units
that describes a system state. The **default target** decides where a normal boot
stops.

Key commands:

- `systemctl get-default` — which target boots by default
- `systemctl set-default TARGET` — change it
- `systemctl list-units --type=target` — targets active right now
- `journalctl -b` — everything logged since the last boot (`-b -1` = previous boot)

Common targets: `multi-user.target` (normal headless boot), `graphical.target`
(adds a GUI on top), `rescue.target` (single-user maintenance shell).

This box has been switched to boot into `rescue.target`. You'll inspect the boot,
then set the default back to `multi-user.target`.
