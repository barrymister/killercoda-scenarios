# journald & logrotate

`journalctl` filters the systemd journal by boot (`-b`), unit (`-u NAME`),
priority (`-p err`), and time (`--since '1 hour ago'`) — combine them to zero in
on a problem. For plain-text logs that systemd doesn't manage, **logrotate** keeps
them bounded: drop a config in `/etc/logrotate.d/`, and use `logrotate -d` for a
dry run before trusting it. The key directives are the schedule (`daily` /
`weekly`), `rotate N` (how many old copies to keep), and `compress` to gzip them.
