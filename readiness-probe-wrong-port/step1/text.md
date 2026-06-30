# Diagnose & fix

```
kubectl get pods
```{{exec}}

`Running` but `0/1 READY`. The Events tell you why:

```
kubectl describe pod -l app=web | grep -A3 -i readiness
```{{exec}}

The readiness probe hits port `8080`, but nginx serves on `80`. Fix the probe
port:

```
kubectl patch deployment web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/readinessProbe/httpGet/port","value":80}]'
```{{exec}}

```
kubectl get pods -w
```{{exec}}

When it reads `1/1` Ready, press **Check**.
