# Create a namespace and use it

Create a namespace called `dev`:

```
kubectl create namespace dev
```{{exec}}

Run a Pod **in** that namespace:

```
kubectl run web --image=nginx:1.27 -n dev
```{{exec}}

The default view won't show it — you have to ask for the namespace:

```
kubectl get pods                 # nothing here
kubectl get pods -n dev          # there it is
```{{exec}}

When a Pod is running in the `dev` namespace, press **Check**.
