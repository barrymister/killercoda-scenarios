# Node back online

`slurmctld` is the brain; `slurmd` is the muscle on each node. If slurmd dies,
that node shows `down*` and runs nothing, even though the controller is healthy.
Restart slurmd (and `resume` the node) to bring it back — the node-level
equivalent of the earlier drain fix.
