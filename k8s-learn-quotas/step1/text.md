# Constrain a namespace

Create a namespace for the team:

```
kubectl create namespace team-a
```{{exec}}

Apply a ResourceQuota that caps total requests and the number of pods in team-a:

```
cat <<'EOF' > /root/quota.yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: team-a-quota
  namespace: team-a
spec:
  hard:
    requests.cpu: "2"
    requests.memory: 2Gi
    pods: "10"
EOF
kubectl apply -f /root/quota.yaml
```{{exec}}

Apply a LimitRange so containers without explicit resource settings get defaults. The default block sets limits and defaultRequest sets requests:

```
cat <<'EOF' > /root/limitrange.yaml
apiVersion: v1
kind: LimitRange
metadata:
  name: team-a-limits
  namespace: team-a
spec:
  limits:
  - type: Container
    default:
      cpu: 500m
      memory: 256Mi
    defaultRequest:
      cpu: 250m
      memory: 128Mi
EOF
kubectl apply -f /root/limitrange.yaml
```{{exec}}

Check that the quota is active and showing its hard limits:

```
kubectl get resourcequota -n team-a -o wide
kubectl describe resourcequota team-a-quota -n team-a
```{{exec}}

When the ResourceQuota reports its hard limits, press **Check**.
