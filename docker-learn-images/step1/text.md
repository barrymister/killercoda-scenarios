# Pull, list, tag

Pull a small image by an explicit tag:

```
docker pull alpine:3.20
```{{exec}}

List what's local now:

```
docker images
```{{exec}}

Give it your own name and tag (`myapp:v1`) — this just adds a label, no copy:

```
docker tag alpine:3.20 myapp:v1
docker images myapp
```{{exec}}

When `myapp:v1` shows up in `docker images`, press **Check**.
