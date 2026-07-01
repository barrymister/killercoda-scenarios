# That's the core loop

`docker run` started a container from the nginx image, `ps` listed it, `logs`
showed its output, and `exec` ran a command inside. `docker rm -f` removes it.
Everything else in Docker builds on this.
