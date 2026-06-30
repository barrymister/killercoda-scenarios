# Diagnose & fix

The `web` Deployment isn't coming up.

```
kubectl get pods
```{{exec}}

Look at *why*:

```
kubectl describe pod -l app=web | tail -20
```{{exec}}

You should see `ImagePullBackOff` / `ErrImagePull` — the image tag is wrong.
Set a valid `nginx` image and watch it recover:

```
kubectl set image deployment/web nginx=nginx:1.27
```{{exec}}

```
kubectl get pods -w
```{{exec}}

When a pod is `Running` and `1/1`, press **Check**.
