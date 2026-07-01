#!/bin/bash
# Wait for the daemon, then run nginx with a healthcheck aimed at port 9999
# (nothing listens there) so the container is marked unhealthy.
until docker info >/dev/null 2>&1; do sleep 1; done
docker rm -f web >/dev/null 2>&1
docker run -d --name web -p 8080:80 --health-cmd='wget -q -O /dev/null http://localhost:9999/ || exit 1' --health-interval=3s --health-retries=2 --health-timeout=2s nginx:1.25-alpine >/dev/null 2>&1
