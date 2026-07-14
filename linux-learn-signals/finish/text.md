# Priority & signals

`nice` sets a process's *starting* priority (`-20` highest .. `19` lowest); once
it's running you change it with `renice -n N -p PID`. To stop a process you send a
**signal**: plain `kill`/`pkill` sends **SIGTERM**, which lets the program clean
up and exit gracefully. `kill -9` is **SIGKILL** — unblockable, the last resort
when something is stuck. **SIGHUP** commonly means "reload your configuration."
Use `ps -eo` to see PIDs and nice values, and `pgrep -f` / `pkill -f` to match on
the full command line.
