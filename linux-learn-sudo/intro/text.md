# sudo lets a user run as root

`sudo` grants specific users the right to run commands as root. Who's allowed is
defined in `/etc/sudoers` — but you never edit that file by hand, because a single
syntax error can lock **everyone** out of sudo.

Key ideas:

- `/etc/sudoers.d/NAME` — a drop-in file; safer than editing the main sudoers
- `visudo -cf FILE` — syntax-check a sudoers file *before* it takes effect
- mode `440` — sudoers files must not be world-writable or sudo refuses them
- `NOPASSWD:ALL` — no password prompt (convenient, less secure) vs. requiring a password

The `deploy` user is already on the box. You'll grant it sudo through a drop-in and
validate it.
