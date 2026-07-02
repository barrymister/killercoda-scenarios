# The node fell off the cluster

Jobs won't run and the node looks unhealthy in `sinfo`. The controller
(slurmctld) is fine, but the **compute daemon** (`slurmd`) that actually runs
work on the node has died. Bring the node back.
