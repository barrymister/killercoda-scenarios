#!/bin/bash
until kubectl get nodes 2>/dev/null | grep -qw Ready; do sleep 2; done
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
        image: polinux/stress
        command: ["stress"]
        args: ["--vm","1","--vm-bytes","150M","--vm-hang","1"]
        resources:
          limits: { memory: "16Mi" }
YAML
