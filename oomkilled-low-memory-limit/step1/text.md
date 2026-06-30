# Diagnose & fix

```
kubectl get pods
```{{exec}}

```
kubectl describe pod -l app=web | grep -A2 -i "last state"
```{{exec}}

`Last State: Terminated, Reason: OOMKilled`. The container needs ~150Mi but the
limit is 16Mi. Raise it:

```
kubectl patch deployment web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/resources/limits/memory","value":"256Mi"}]'
```{{exec}}

```
kubectl get pods -w
```{{exec}}

When it stays `Running`, press **Check**.
