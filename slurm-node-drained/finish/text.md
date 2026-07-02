# Node back in service

A `drain`/`down` node silently blocks all scheduling — `sinfo -R` shows the
reason, and `scontrol update ... state=resume` brings it back. This is one of
the most common "the cluster is stuck" tickets in real GPU ops.
