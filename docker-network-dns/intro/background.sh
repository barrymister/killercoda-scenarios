#!/bin/bash
# Wait for the daemon, then start both containers on the DEFAULT bridge, where
# Docker's embedded DNS does NOT resolve container names.
until docker info >/dev/null 2>&1; do sleep 1; done
docker rm -f app db >/dev/null 2>&1
docker network rm appnet >/dev/null 2>&1
docker run -d --name db -e POSTGRES_PASSWORD=secret postgres:16-alpine >/dev/null 2>&1
docker run -d --name app alpine sleep 3600 >/dev/null 2>&1
