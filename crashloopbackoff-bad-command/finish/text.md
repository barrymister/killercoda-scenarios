# Nice work

`CrashLoopBackOff` = the container starts then exits. The answer is in
`kubectl logs <pod> --previous` (last run's output) and the container's
command/args. Fix the command, confirm it stays `Running`.
