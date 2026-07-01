# Nice work

A `HEALTHCHECK` is only as good as what it probes. Pointed at the wrong
port/path, a perfectly good container is flagged `unhealthy` and load balancers
route around it. `docker inspect .State.Health` shows the command and the last
failing output — the same debugging move as a Kubernetes readiness probe on the
wrong port.
