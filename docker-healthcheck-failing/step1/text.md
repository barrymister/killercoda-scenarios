# Diagnose & fix

```
docker ps
```{{exec}}

`web` shows `(unhealthy)`. See why the probe fails:

```
docker inspect -f '{{json .State.Health}}' web
```{{exec}}

The health command hits `http://localhost:9999/` — but nginx serves on `80`, so
the probe always fails. The container is fine; the check is wrong. Re-run with a
healthcheck that hits the real port:

```
docker rm -f web
docker run -d --name web -p 8080:80 --health-cmd='wget -q -O /dev/null http://localhost:80/ || exit 1' --health-interval=3s --health-retries=2 --health-timeout=2s nginx:1.25-alpine
```{{exec}}

Give it a few seconds, then confirm:

```
docker inspect -f '{{.State.Health.Status}}' web
```{{exec}}

When it prints `healthy`, press **Check**.
