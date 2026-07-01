# Diagnose & fix

The container is up:

```
docker ps
```{{exec}}

But nothing answers on 8080:

```
curl -s -m 3 http://localhost:8080/ ; echo "(exit $?)"
```{{exec}}

Look at how the port is published:

```
docker port web
```{{exec}}

It maps host `8080` -> container `9999`, but nginx listens on `80`. The traffic
lands on a port nothing serves. Re-run mapping to the right container port:

```
docker rm -f web
docker run -d --name web -p 8080:80 nginx:1.25
```{{exec}}

```
curl -s -m 3 http://localhost:8080/ | head -1
```{{exec}}

When the nginx page loads, press **Check**.
