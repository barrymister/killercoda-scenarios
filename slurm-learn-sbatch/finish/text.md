# You ran a batch job

`#SBATCH` lines set the job's name, output file, and resources. `sbatch`
queues the script and returns a job ID; the output lands in the file you named.
This is exactly how training jobs are launched on a real cluster.
