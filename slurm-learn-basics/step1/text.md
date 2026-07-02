# sinfo, srun, squeue

See the cluster's nodes and partitions:

```
sinfo
```{{exec}}

`idle` means the node is up and free. Now run a command **through Slurm** with
`srun` — it schedules the command on the node instead of running it locally:

```
srun hostname
srun bash -c 'echo "my first slurm job ran" > /root/ran.txt'
```{{exec}}

Check what's in the queue (it'll usually be empty — the jobs above were quick):

```
squeue
```{{exec}}

Once `/root/ran.txt` exists (your srun job created it), press **Check**.
