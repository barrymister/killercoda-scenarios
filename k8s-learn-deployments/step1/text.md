# Create, scale, roll

Create a Deployment named `web`:

```
kubectl create deployment web --image=nginx:1.27
```{{exec}}

Ask for **3** copies:

```
kubectl scale deployment web --replicas=3
```{{exec}}

Watch three Pods appear (Ctrl-C when all are `Running`):

```
kubectl get pods -l app=web -w
```{{exec}}

Roll out a new image version — Kubernetes replaces Pods gradually:

```
kubectl set image deployment/web nginx=nginx:1.28
kubectl rollout status deployment/web
```{{exec}}

When the Deployment shows **3** available replicas, press **Check**.
