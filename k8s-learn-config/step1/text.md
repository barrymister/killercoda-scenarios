# Create a ConfigMap and use it

Make a ConfigMap with one key:

```
kubectl create configmap app-config --from-literal=GREETING=hello-bench
```{{exec}}

Run a Pod that reads that key into an env var, and print it:

```
kubectl run greeter --image=busybox --restart=Never --env="GREETING=placeholder" -- sh -c 'sleep 3600'
kubectl set env pod/greeter --from=configmap/app-config
```{{exec}}

Inspect what the ConfigMap holds:

```
kubectl get configmap app-config -o jsonpath='{.data}' ; echo
```{{exec}}

When the ConfigMap has the `GREETING` key, press **Check**.
