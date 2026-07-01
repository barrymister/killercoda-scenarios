#!/bin/bash
# Wait for the daemon, drop a custom homepage, then mount it to the WRONG path
# inside the container (nginx serves /usr/share/nginx/html, not /wrong/path).
until docker info >/dev/null 2>&1; do sleep 1; done
mkdir -p /root/site
echo '<h1>It works from the volume</h1>' > /root/site/index.html
docker rm -f web >/dev/null 2>&1
docker run -d --name web -p 8080:80 -v /root/site:/wrong/path nginx:1.25 >/dev/null 2>&1
