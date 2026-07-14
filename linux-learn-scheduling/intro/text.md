# Scheduling recurring work

Linux has three ways to run jobs on a schedule:

- **cron** — the classic recurring scheduler. Each line is `min hour day-of-month
  month day-of-week` followed by the command.
- **at** — runs a command **once** at a future time, e.g. `at now + 1 hour`.
- **systemd timers** — the modern, journald-integrated option: a `.timer` unit
  triggers a `.service` unit on an `OnCalendar=` schedule.

cron commands:

- `crontab -l` — list the current user's jobs
- `crontab -e` — edit them in an editor
- `crontab -` — replace the whole crontab from stdin

You'll write a small backup script and schedule it to run every day at 02:00.
