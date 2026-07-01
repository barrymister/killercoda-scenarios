# Find the hog, then kill it

Who's eating the CPU? Sort processes by usage:

```
ps aux --sort=-%cpu | head -5
```{{exec}}

It's `hog.sh`. Confirm its PID, then stop it by name:

```
pgrep -af hog.sh
pkill -f hog.sh
```{{exec}}

Confirm it's gone and the CPU settles:

```
pgrep -af hog.sh || echo "stopped"
ps aux --sort=-%cpu | head -3
```{{exec}}

Once `hog.sh` is no longer running, press **Check**.
