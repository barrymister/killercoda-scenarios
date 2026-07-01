# CPU reclaimed

`ps aux --sort=-%cpu` (or `top`/`htop`) finds the busiest process. `pkill -f`
stops it by matching its command line; `kill <PID>` stops a specific one, and
`kill -9` is the last resort when it ignores a polite signal. Real fix: find why
it spun (bad loop, stuck retry) before it comes back.
