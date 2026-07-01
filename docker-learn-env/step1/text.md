# Set an env var and read it

Run a container with `APP_ENV` set to `prod`:

```
docker run -d --name web -e APP_ENV=prod nginx
```{{exec}}

Read it back from inside the container:

```
docker exec web printenv APP_ENV
```{{exec}}

Inspect all of its env at once:

```
docker exec web env | sort
```{{exec}}

When `web` is running with `APP_ENV=prod`, press **Check**.
