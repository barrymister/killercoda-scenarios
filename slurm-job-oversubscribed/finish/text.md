# Right-sized and running

`squeue` + `scontrol show job` reveal *why* a job is pending. A request bigger
than the node (here 64 CPUs) never schedules. Fixing the `#SBATCH` request is a
daily reality — users routinely over-ask for CPUs, memory, or GPUs.
