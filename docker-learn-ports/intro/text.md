# Containers are sealed until you publish

By default a container's ports aren't reachable from the host. You **publish**
one with `-p host:container`. You'll run nginx and hit it on `localhost:8080`.
