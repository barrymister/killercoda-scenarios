# Auth restored

munge is Slurm's shared-secret authentication between slurmctld, slurmd and the
client commands. If munged isn't running, every Slurm command is rejected —
restarting it fixes the whole cluster at once. A classic "everything's broken"
root cause that's actually one service.
