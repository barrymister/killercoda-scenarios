# Publish 8080 -> 80

Run nginx, mapping host port **8080** to the container's port **80**:

```
docker run -d --name web -p 8080:80 nginx
```{{exec}}

Confirm the mapping:

```
docker port web
```{{exec}}

Call it on the host:

```
curl -s -o /dev/null -w "%{http_code}\n" http://localhost:8080
```{{exec}}

When `docker port web` shows `80/tcp -> 0.0.0.0:8080`, press **Check**.
