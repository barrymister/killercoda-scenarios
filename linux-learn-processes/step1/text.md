# See what's running, then start a job

List processes, and the biggest CPU users:

```
ps aux | head
ps aux --sort=-%cpu | head -5
```{{exec}}

Start a long-running job in the background (the `&`):

```
sleep 600 &
```{{exec}}

Find it — by job, and by matching its command:

```
jobs
pgrep -af "sleep 600"
```{{exec}}

That's how you'd stop it (leave it running for the Check):

```
# kill %1        # by job number
# pkill -f "sleep 600"
```{{exec}}

While the `sleep 600` job is running, press **Check**.
