# Create and inspect a Pod

Run a single nginx Pod called `web`:

```
kubectl run web --image=nginx:1.27
```{{exec}}

Watch it come up (Ctrl-C once it's `Running`):

```
kubectl get pods -w
```{{exec}}

See where it landed and what happened:

```
kubectl describe pod web | tail -n 20
```{{exec}}

Read the container's logs, and run a command *inside* it:

```
kubectl logs web
kubectl exec web -- nginx -v
```{{exec}}

When `web` is `Running`, press **Check**.
