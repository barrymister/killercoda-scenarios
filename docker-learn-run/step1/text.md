# Start and inspect a container

Run nginx in the background, named `web`:

```
docker run -d --name web nginx
```{{exec}}

List what's running:

```
docker ps
```{{exec}}

Read its logs, and run a command *inside* it:

```
docker logs web
docker exec web nginx -v
```{{exec}}

When you're done, this is how you stop and remove it (do this later, not now):

```
# docker rm -f web
```{{exec}}

While `web` is **Up**, press **Check**.
