# Users and groups

`useradd -m` creates a home directory, `-s` sets the login shell, and `-G` sets
supplementary groups at creation time. To add a group later use `usermod -aG` — the
`-a` **appends**; forget it and you overwrite every group the user already had.
Accounts live in `/etc/passwd`, groups in `/etc/group`, and password hashes in
`/etc/shadow`. `id` and `getent passwd` are your quick inspection tools.
