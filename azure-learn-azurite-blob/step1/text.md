# Container + blob against the emulator

```
cd /root/lab
source conn.env
```{{exec}}

`$AZ_CONN` is the standard Azurite dev connection string. Create a container:

```
az storage container create --name data --connection-string "$AZ_CONN"
```{{exec}}

Upload a blob into it:

```
az storage blob upload --container-name data --name hello.txt \
  --file hello.txt --connection-string "$AZ_CONN"
```{{exec}}

List the blobs to confirm:

```
az storage blob list --container-name data --connection-string "$AZ_CONN" -o table
```{{exec}}

When `hello.txt` shows in the container, press **Check**.
