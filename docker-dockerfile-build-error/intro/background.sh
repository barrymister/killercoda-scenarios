#!/bin/bash
# Wait for the daemon, drop a tiny app + a Dockerfile with an invalid instruction
# (FRON instead of FROM), and pre-pull the base image so the fixed build is fast.
until docker info >/dev/null 2>&1; do sleep 1; done
mkdir -p /root/app
cat > /root/app/app.py <<'PY'
print("hello from myapp")
PY
cat > /root/app/Dockerfile <<'DOCKER'
FRON python:3.12-slim
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]
DOCKER
docker pull python:3.12-slim >/dev/null 2>&1
