# Node down — is slurmd running?

Look at the node's state:

```
sinfo
scontrol show node localhost | grep -E "State|Reason"
```{{exec}}

A `down*`/`unk*` node with a working controller usually means `slurmd` isn't
running on it. Check and restart it:

```
systemctl status slurmd --no-pager 2>/dev/null | head -5
systemctl start slurmd 2>/dev/null || slurmd
sleep 2
```{{exec}}

Return the node to service and prove it schedules:

```
scontrol update nodename=localhost state=resume
sinfo
srun hostname
```{{exec}}

Once the node is `idle`/`mixed`/`alloc` and a job runs, press **Check**.
