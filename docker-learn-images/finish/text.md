# Images & tags

`pull` fetched `alpine:3.20` from Docker Hub; `tag` added the `myapp:v1` name
pointing at the same image ID. Always pin an explicit tag (not `latest`) so you
know exactly what you're running. `docker push` would send it to a registry.
