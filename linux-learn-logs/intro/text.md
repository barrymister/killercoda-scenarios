# Reading logs and keeping them bounded

Two log jobs come up constantly:

- **journald** — systemd's built-in log store. Query it with `journalctl`:
  - `journalctl -b` — logs since the last boot
  - `journalctl -u NAME` — one unit's logs
  - `journalctl -p err` — only error-priority and worse
  - `journalctl --since '1 hour ago'` — time-filtered

- **logrotate** — stops plain-text log files from growing forever. Drop-in
  configs live in `/etc/logrotate.d/`. `logrotate -d CONFIG` does a **dry run**
  (debug), showing what it *would* do without touching anything.

A fake app log is already at `/var/log/benchapp.log`. You'll query the journal,
then write a rotation policy for that file.
