# Service running

`systemctl status <unit>` and `journalctl -u <unit>` are the first two moves for
any dead service — they almost always name the cause. Exit code **203/EXEC**
means the `ExecStart=` binary is missing or not executable: fix the path or
provide the program, then `systemctl start`. Whenever you edit a unit file, run
`systemctl daemon-reload` so systemd re-reads it before you try again.
