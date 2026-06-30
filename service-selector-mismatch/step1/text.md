# Diagnose & fix

The pods are healthy:

```
kubectl get pods -l app=web
```{{exec}}

But the Service has **no endpoints**:

```
kubectl get endpoints web
```{{exec}}

Compare the Service selector to the pod labels:

```
kubectl describe svc web | grep Selector
kubectl get pods --show-labels
```{{exec}}

The selector says `app=web-broken`; the pods are `app=web`. Fix the selector:

```
kubectl patch svc web -p '{"spec":{"selector":{"app":"web"}}}'
```{{exec}}

```
kubectl get endpoints web
```{{exec}}

When endpoints lists a pod IP, press **Check**.
