# Nice work

`Exited (1)` with empty logs = the container's own command failed or returned
immediately (the Docker version of `CrashLoopBackOff`). `docker logs` shows
app output; `docker inspect -f '{{.Config.Cmd}}'` shows what it actually runs.
A long-lived process (a server, or `sleep`) keeps the container up.
