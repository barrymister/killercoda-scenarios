# Taint the node, then tolerate it

First find the node name:

```
kubectl get nodes
```{{exec}}

Taint the node so ordinary Pods are repelled. Replace `<node>` with the name from above (on this single-node cluster it is usually `controlplane`):

```
kubectl taint nodes <node> dedicated=team:NoSchedule
```{{exec}}

With that taint in place, a plain Pod with no toleration would stay `Pending` because there is nowhere for it to schedule. Now create a Pod that carries a matching toleration:

```
cat <<'EOF' | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: tolerant
spec:
  tolerations:
  - key: dedicated
    operator: Equal
    value: team
    effect: NoSchedule
  containers:
  - name: web
    image: nginx
EOF
```{{exec}}

Wait for it to be ready:

```
kubectl wait --for=condition=Ready pod/tolerant --timeout=90s
```{{exec}}

Confirm it is running:

```
kubectl get pod tolerant -o wide
```{{exec}}

When the `tolerant` Pod is `Running`, press **Check**.
