# Why won't anything schedule?

Start with the reflex — look at the node and the queue:

```
sinfo
squeue
```{{exec}}

A node that's `drain`/`drng`/`down` won't accept jobs. Read *why*:

```
sinfo -R
scontrol show node localhost | grep -E "State|Reason"
```{{exec}}

Bring the node back into service (resume it):

```
scontrol update nodename=localhost state=resume
```{{exec}}

Prove jobs flow again:

```
sinfo
srun hostname
```{{exec}}

Once the node is back to `idle`/`mixed`/`alloc` (not drain/down), press **Check**.
