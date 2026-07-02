# Batch jobs: submit and walk away

Interactive `srun` is fine for quick things, but real training runs are
submitted as **batch scripts** with `sbatch`. The scheduler queues the script,
runs it when resources are free, and saves its output to a file.

A Slurm cluster is starting. A starter script `/root/hello.sh` is waiting.
