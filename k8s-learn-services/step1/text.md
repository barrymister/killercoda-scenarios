# Create a Service and hit it

Expose the `web` Deployment on port 80:

```
kubectl expose deployment web --port=80 --name=web
```{{exec}}

A Service only works if it actually selects Pods. Confirm it has **endpoints**
(the Pod IPs behind it):

```
kubectl get endpoints web
```{{exec}}

Call it by name from a throwaway Pod — Kubernetes DNS resolves `web`:

```
kubectl run curl --rm -it --image=curlimages/curl --restart=Never -- curl -s -o /dev/null -w "%{http_code}\n" http://web
```{{exec}}

When `web` has endpoints listed, press **Check**.
