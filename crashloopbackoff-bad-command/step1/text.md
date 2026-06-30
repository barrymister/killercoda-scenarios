# Diagnose & fix

```
kubectl get pods
```{{exec}}

`CrashLoopBackOff` with a rising restart count. See why it exits:

```
kubectl describe pod -l app=web | tail -20
```{{exec}}

The container runs `/bin/false`, which exits 1 immediately. Give it a command
that stays alive:

```
kubectl patch deployment web --type=json -p='[{"op":"replace","path":"/spec/template/spec/containers/0/command","value":["/bin/sh","-c","sleep 3600"]}]'
```{{exec}}

```
kubectl get pods -w
```{{exec}}

When the pod is `Running` and not restarting, press **Check**.
