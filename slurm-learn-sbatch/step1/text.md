# sbatch

Look at the batch script — the `#SBATCH` lines are directives to the scheduler:

```
cat /root/hello.sh
```{{exec}}

Submit it:

```
sbatch /root/hello.sh
```{{exec}}

`sbatch` prints a **job ID** and returns immediately. Watch it in the queue,
then read its output when it finishes:

```
squeue
sleep 3
cat /root/hello.out
```{{exec}}

Once `/root/hello.out` exists with the job's output, press **Check**.
