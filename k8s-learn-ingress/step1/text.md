# Author an Ingress rule

An Ingress is a set of HTTP routing rules: for a given host and URL path, send traffic to a backend Service and port. An ingress controller watches these rules and serves the traffic.

First create a deployment to act as the backend:

```
kubectl create deployment web --image=nginx:1.27
```{{exec}}

Expose it as a Service on port 80:

```
kubectl expose deployment web --port=80
```{{exec}}

Now author an Ingress named `web-ing` that routes host `demo.local` and path `/` to the `web` Service on port 80:

```
cat <<'EOF' | kubectl apply -f -
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: web-ing
spec:
  rules:
  - host: demo.local
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: web
            port:
              number: 80
EOF
```{{exec}}

Confirm the rule was recorded:

```
kubectl get ingress web-ing -o jsonpath='{.spec.rules[0].host}'
```{{exec}}

When the Ingress `web-ing` exists with host `demo.local`, press **Check**.
