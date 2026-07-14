# From denied to allowed

The ServiceAccount `reader` already exists. First, confirm it currently CANNOT list pods:

```
kubectl auth can-i list pods --as=system:serviceaccount:default:reader -n default
```{{exec}}

That prints `no`. Now create a **Role** allowing read verbs on pods:

```
kubectl create role pod-reader --verb=get,list,watch --resource=pods -n default
```{{exec}}

Bind that Role to the ServiceAccount with a **RoleBinding**:

```
kubectl create rolebinding reader-binding --role=pod-reader --serviceaccount=default:reader -n default
```{{exec}}

Re-check the permission - it now prints `yes`:

```
kubectl auth can-i list pods --as=system:serviceaccount:default:reader -n default
```{{exec}}

When the last command prints **yes**, press **Check**.
