#!/bin/bash
# Wait for the daemon, then start Postgres with no POSTGRES_PASSWORD -> it refuses
# to initialise and exits.
until docker info >/dev/null 2>&1; do sleep 1; done
docker rm -f db >/dev/null 2>&1
docker run -d --name db postgres:16-alpine >/dev/null 2>&1
