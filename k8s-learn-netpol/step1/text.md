# Author a NetworkPolicy

A NetworkPolicy selects target pods with a `podSelector` and then whitelists allowed sources. Anything not whitelisted is denied for the pods it selects. Here the target is pods labeled `app=api`, and the only allowed source is pods labeled `app=web`.

Create the two labeled pods:

```
kubectl run api --image=nginx:1.27 --labels=app=api
```{{exec}}

```
kubectl run web --image=nginx:1.27 --labels=app=web
```{{exec}}

Now author a NetworkPolicy named `api-allow`. It selects pods `app=api`, sets the Ingress policy type, and allows ingress only from pods `app=web`:

```
cat <<'EOF' | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: api-allow
spec:
  podSelector:
    matchLabels:
      app: api
  policyTypes:
  - Ingress
  ingress:
  - from:
    - podSelector:
        matchLabels:
          app: web
EOF
```{{exec}}

Confirm the policy selects the right pods:

```
kubectl get netpol api-allow -o jsonpath='{.spec.podSelector.matchLabels.app}'
```{{exec}}

When the NetworkPolicy `api-allow` exists and selects `app=api`, press **Check**.
