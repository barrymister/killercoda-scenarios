# Diagnose & fix

Try to build the image and read the error:

```
cd /root/app && docker build -t myapp .
```{{exec}}

The build fails immediately: `unknown instruction: FRON`. The first line should
be `FROM`, not `FRON`. Look at the Dockerfile:

```
cat /root/app/Dockerfile
```{{exec}}

Fix the typo on the first line:

```
sed -i '1s/^FRON /FROM /' /root/app/Dockerfile
```{{exec}}

Build again — it should succeed now:

```
docker build -t myapp /root/app
```{{exec}}

Run it to confirm the app works:

```
docker run --rm myapp
```{{exec}}

When it prints `hello from myapp`, press **Check**.
