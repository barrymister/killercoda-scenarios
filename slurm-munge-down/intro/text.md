# "Invalid authentication credential"

Every Slurm command suddenly errors out — `squeue`, `sinfo`, everything. The
daemons look like they're around, but nothing authenticates. Slurm uses
**munge** for auth between its components; if munge is down, Slurm is deaf.
