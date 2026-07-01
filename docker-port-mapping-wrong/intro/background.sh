#!/bin/bash
# Wait for the daemon, then publish host 8080 to a container port nothing serves.
until docker info >/dev/null 2>&1; do sleep 1; done
docker rm -f web >/dev/null 2>&1
docker run -d --name web -p 8080:9999 nginx:1.25 >/dev/null 2>&1
