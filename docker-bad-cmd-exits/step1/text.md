# Diagnose & fix

```
docker ps -a
```{{exec}}

`app` is `Exited (1)`. Nothing in the logs:

```
docker logs app
```{{exec}}

So the *command itself* exits. Check what it runs:

```
docker inspect -f '{{.Config.Cmd}}' app
```{{exec}}

It's `/bin/false`, which exits `1` the instant it starts — so the container
dies. Replace it with a command that stays alive:

```
docker rm -f app
docker run -d --name app busybox sleep 3600
```{{exec}}

```
docker ps
```{{exec}}

When `app` is `Up`, press **Check**.
