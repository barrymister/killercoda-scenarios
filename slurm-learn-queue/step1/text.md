# squeue, scontrol show job, scancel

See the queue — there's a long `sleep` job running:

```
squeue
```{{exec}}

Read the full detail of that job (state, resources, reason):

```
scontrol show job $(squeue -h -o %i | head -1)
```{{exec}}

Cancel it by its job ID:

```
scancel $(squeue -h -o %i | head -1)
sleep 1
squeue
```{{exec}}

Once the queue is empty (you cancelled the job), press **Check**.
