# Read the Reason, then fix the request

Look at the queue and the pending job's reason:

```
squeue -o "%.6i %.9P %.12j %.8T %.20R"
scontrol show job $(squeue -h -o %i | head -1) | grep -E "Reason|NumCPUs|TRES"
```{{exec}}

A reason like `PartitionConfig` / `Resources` means the job asks for more than
the node has. Look at the script and what the node offers:

```
cat /root/train.sh
nproc
```{{exec}}

Cancel the impossible job, edit `/root/train.sh` so the `#SBATCH -c` request
fits (e.g. `-c 1`), then resubmit:

```
scancel $(squeue -h -o %i | head -1)
sed -i 's/^#SBATCH -c .*/#SBATCH -c 1/' /root/train.sh
sbatch /root/train.sh
sleep 3
cat /root/train.out
```{{exec}}

Once `/root/train.out` exists (the fixed job ran), press **Check**.
