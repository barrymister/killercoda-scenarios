# Diagnose & fix

Nothing is running yet:

```
docker ps -a
```{{exec}}

Reproduce the teammate's command and read the error:

```
docker run -d --name web nginx:1.99
```{{exec}}

The daemon can't find that tag (`manifest unknown` / `not found`). `nginx:1.99`
was never published. Use a real tag instead:

```
docker run -d --name web nginx:1.25
```{{exec}}

Confirm it's up:

```
docker ps
```{{exec}}

When `web` is `Up`, press **Check**.
