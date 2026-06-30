# Diagnose & fix

```
kubectl get pods
```{{exec}}

```
kubectl describe pod -l app=web | grep -A2 -i "config"
```{{exec}}

The container wants env `DATABASE_URL` from ConfigMap `app-config`, but that key
doesn't exist:

```
kubectl get configmap app-config -o yaml
```{{exec}}

Add the missing key (then the deployment will roll a new pod):

```
kubectl patch configmap app-config -p '{"data":{"DATABASE_URL":"postgres://db:5432/app"}}'
kubectl rollout restart deployment web
```{{exec}}

```
kubectl get pods -w
```{{exec}}

When it's `Running`, press **Check**.
