# Diagnose & fix

Both containers are up:

```
docker ps
```{{exec}}

But the app can't resolve `db` by name:

```
docker exec app nslookup db ; echo "(exit $?)"
```{{exec}}

They're both on the **default bridge**, where Docker's built-in DNS does not
resolve container names — name-based service discovery only works on a
**user-defined network**. Check what network they're on:

```
docker inspect -f '{{range $k,$v := .NetworkSettings.Networks}}{{$k}} {{end}}' app
```{{exec}}

Create a user-defined network and attach both containers:

```
docker network create appnet
docker network connect appnet db
docker network connect appnet app
```{{exec}}

Now name resolution works:

```
docker exec app nslookup db
```{{exec}}

When `nslookup db` resolves, press **Check**.
