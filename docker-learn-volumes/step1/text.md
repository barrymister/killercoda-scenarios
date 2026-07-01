# Write, destroy, prove it persisted

Create a named volume:

```
docker volume create appdata
```{{exec}}

Mount it at `/data` and write a file, then remove the container:

```
docker run --rm -v appdata:/data alpine sh -c 'echo bench > /data/hello.txt'
```{{exec}}

The container is gone. Mount the **same** volume in a fresh container and read it:

```
docker run --rm -v appdata:/data alpine cat /data/hello.txt
```{{exec}}

When the volume `appdata` exists, press **Check**.
