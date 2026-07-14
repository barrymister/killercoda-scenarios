# Scheduling

A cron line has five time fields — `min hour day-of-month month day-of-week` —
before the command, with `*` meaning "every". `crontab -e` edits your jobs and
`crontab -l` lists them. For a one-off job, `at now + 1 hour` runs a command once
at a future time. The modern alternative is a **systemd timer**: a `.timer` unit
with `OnCalendar=*-*-* 02:00:00` triggers a matching `.service`, and because it
runs under systemd its output lands in the journal (`journalctl -u`).
