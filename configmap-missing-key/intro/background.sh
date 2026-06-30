#!/bin/bash
until kubectl get nodes 2>/dev/null | grep -qw Ready; do sleep 2; done
kubectl create configmap app-config --from-literal=LOG_LEVEL=info >/dev/null 2>&1
kubectl apply -f - >/dev/null 2>&1 <<'YAML'
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
  labels: { app: web }
spec:
  replicas: 1
  selector: { matchLabels: { app: web } }
  template:
    metadata: { labels: { app: web } }
    spec:
      containers:
      - name: web
        image: nginx:1.27
        env:
        - name: DATABASE_URL
          valueFrom:
            configMapKeyRef: { name: app-config, key: DATABASE_URL }
YAML
