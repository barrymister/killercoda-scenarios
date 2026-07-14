# Inspecting and steering processes

Every running program is a **process** with a PID. Two things you often need to
adjust: how much CPU it's allowed to fight for (**priority**), and how you ask it
to stop or reload (**signals**).

Key commands:

- `ps -eo pid,ni,cmd` — list processes with PID, nice value, and command
- `pgrep -f PATTERN` — find PIDs by command line
- `renice -n N -p PID` — change a *running* process's nice value
- `kill -SIGNAL PID` / `pkill -SIGNAL -f PATTERN` — send a signal

Nice values run from `-20` (highest priority) to `19` (lowest). Signals you'll
meet: **SIGTERM** (polite stop), **SIGKILL** (`-9`, unblockable), **SIGHUP**
(often "reload your config").

A long `sleep 6000` is already running in the background. You'll deprioritize it,
then stop it.
