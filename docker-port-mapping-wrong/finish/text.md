# Nice work

`-p HOST:CONTAINER` only works when `CONTAINER` is the port the process inside
actually listens on. `docker port <name>` shows the mapping; match it to the
app's real port (nginx = 80). Same reflex as a Kubernetes Service pointing at
the wrong `targetPort`.
