# Roll out a new image, then roll it back

A Deployment named `web` already exists running `nginx:1.27`. Confirm it is ready:

```
kubectl get deployment web
```{{exec}}

Update the container image. The container in this Deployment is named `nginx`, so we set that container's image to `nginx:1.28`:

```
kubectl set image deployment/web nginx=nginx:1.28
```{{exec}}

Watch the rolling update finish. This waits until all new Pods are available:

```
kubectl rollout status deployment/web
```{{exec}}

Now imagine `nginx:1.28` misbehaves. Roll back to the previous revision:

```
kubectl rollout undo deployment/web
```{{exec}}

Confirm the image reverted to `nginx:1.27`:

```
kubectl get deployment web -o jsonpath='{.spec.template.spec.containers[0].image}'; echo
```{{exec}}

When the image reads `nginx:1.27` again, press **Check**.
