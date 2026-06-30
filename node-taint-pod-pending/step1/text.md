# Diagnose & fix

```
kubectl get pods -o wide
```{{exec}}

`Pending`. The scheduler explains why in the Events:

```
kubectl describe pod -l app=web | grep -A3 -i events
```{{exec}}

`had untolerated taint {dedicated: team-a}`. The only node carries a taint your
pod doesn't tolerate. Add a matching toleration:

```
kubectl patch deployment web --type=json -p='[{"op":"add","path":"/spec/template/spec/tolerations","value":[{"key":"dedicated","operator":"Equal","value":"team-a","effect":"NoSchedule"}]}]'
```{{exec}}

```
kubectl get pods -w
```{{exec}}

When the pod is `Running`, press **Check**.
