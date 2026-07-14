#!/bin/bash
until kubectl get nodes 2>/dev/null | grep -qw Ready; do sleep 2; done
# Warmup done - cluster is Ready. Now introduce the fault.
# Create a target app and Service, then apply a deny-all ingress NetworkPolicy.
kubectl create deployment web --image=nginx:1.27 >/dev/null 2>&1
kubectl expose deployment web --port=80 >/dev/null 2>&1
cat <<'EOF' | kubectl apply -f - >/dev/null 2>&1
apiVersion: networking.k8s.io/v1
kind: NetworkPolicy
metadata:
  name: default-deny
  namespace: default
spec:
  podSelector: {}
  policyTypes:
  - Ingress
EOF
