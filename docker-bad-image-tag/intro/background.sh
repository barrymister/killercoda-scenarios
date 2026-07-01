#!/bin/bash
# Wait for the Docker daemon, then warm the cache with a valid nginx image so the
# fix is instant. The "fault" is that the tag the teammate used doesn't exist.
until docker info >/dev/null 2>&1; do sleep 1; done
docker rm -f web >/dev/null 2>&1
docker pull nginx:1.25 >/dev/null 2>&1
