# -c (cpus), --mem, -p (partition)

See what the node actually has:

```
sinfo -o "%n %c %m %P"
scontrol show node localhost | grep -E "CPUTot|RealMemory"
```{{exec}}

Run a job that requests 2 CPUs and a little memory, and have it record what it
got:

```
srun -c 2 --mem=100M bash -c 'nproc > /root/got.txt; echo "ran with $(nproc) cpus"'
```{{exec}}

Confirm what the job saw:

```
cat /root/got.txt
```{{exec}}

Once `/root/got.txt` exists, press **Check**.
