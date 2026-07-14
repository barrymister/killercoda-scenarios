# Prioritize, then signal

Find the background `sleep`. The `[s]leep` trick stops `grep` from matching its
own line; the `ni` column is the current nice value:

```
ps -eo pid,ni,cmd | grep '[s]leep 6000'
```{{exec}}

Lower its priority to nice `10` (less CPU-greedy). `pgrep -f` supplies the PID:

```
renice -n 10 -p "$(pgrep -f 'sleep 6000')"
```{{exec}}

Confirm the new nice value is `10`:

```
ps -eo pid,ni,cmd | grep '[s]leep 6000'
```{{exec}}

Now stop it cleanly. `-TERM` sends **SIGTERM**, the polite default that lets a
program shut down on its own. **SIGKILL** (`kill -9`) can't be caught or ignored —
save it for processes that won't die. **SIGHUP** usually tells a daemon to reload
its config without restarting:

```
pkill -TERM -f 'sleep 6000'
```{{exec}}

When `pgrep -f 'sleep 6000'` returns nothing, press **Check**.
