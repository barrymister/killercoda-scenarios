# Processes under control

`ps aux` lists every process; sorting by `%cpu` finds hogs. `&` backgrounds a
job, `jobs` and `pgrep` find it, and `kill`/`pkill` stop it (by PID, `%job`, or
name). `top`/`htop` show the same live. This is the core of "what's this box
doing and how do I stop it?"
