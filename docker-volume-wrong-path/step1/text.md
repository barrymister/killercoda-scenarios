# Diagnose & fix

The container is up, but the wrong content serves:

```
curl -s -m 3 http://localhost:8080/ | head -3
```{{exec}}

Look at where the volume is mounted:

```
docker inspect -f '{{range .Mounts}}{{.Source}} -> {{.Destination}}  {{end}}' web
```{{exec}}

The host file is mounted to `/wrong/path`, but nginx serves its site from
`/usr/share/nginx/html`. The mount has to target the directory the app reads.
Re-run with the correct destination:

```
docker rm -f web
docker run -d --name web -p 8080:80 -v /root/site:/usr/share/nginx/html nginx:1.25
```{{exec}}

```
curl -s -m 3 http://localhost:8080/
```{{exec}}

When you see "It works from the volume", press **Check**.
