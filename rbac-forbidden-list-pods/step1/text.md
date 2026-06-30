# Diagnose & fix

Confirm the denial:

```
kubectl auth can-i list pods --as=system:serviceaccount:default:reader -n default
```{{exec}}

It prints `no`. The `reader` ServiceAccount has no Role granting it. Create a
Role that allows listing pods and bind it to the ServiceAccount:

```
kubectl create role pod-reader --verb=get,list,watch --resource=pods -n default
kubectl create rolebinding reader-binding --role=pod-reader --serviceaccount=default:reader -n default
```{{exec}}

Verify access is now granted:

```
kubectl auth can-i list pods --as=system:serviceaccount:default:reader -n default
```{{exec}}

When it prints `yes`, press **Check**.
