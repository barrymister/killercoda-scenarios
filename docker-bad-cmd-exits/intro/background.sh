#!/bin/bash
# Wait for the daemon, then start a container whose command exits 1 immediately.
until docker info >/dev/null 2>&1; do sleep 1; done
docker rm -f app >/dev/null 2>&1
docker run -d --name app --restart=no busybox /bin/false >/dev/null 2>&1
