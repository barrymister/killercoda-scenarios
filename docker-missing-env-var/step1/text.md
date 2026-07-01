# Diagnose & fix

```
docker ps -a
```{{exec}}

`db` is exited. This container tells you exactly what went wrong — read its logs:

```
docker logs db 2>&1 | tail -20
```{{exec}}

Postgres refuses to start without a password: *"You must specify
POSTGRES_PASSWORD ..."*. Supply the required env var and re-run:

```
docker rm -f db
docker run -d --name db -e POSTGRES_PASSWORD=secret postgres:16-alpine
```{{exec}}

```
docker ps
```{{exec}}

When `db` is `Up`, press **Check**.
