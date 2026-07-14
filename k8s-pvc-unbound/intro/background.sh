#!/bin/bash
until kubectl get nodes 2>/dev/null | grep -qw Ready; do sleep 2; done
# Warmup done - cluster is Ready. Now introduce the fault.
# Create a PVC with NO matching PV, and a pod that mounts it, so the pod hangs.
cat <<'EOF' | kubectl apply -f - >/dev/null 2>&1
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: data-pvc
  namespace: default
spec:
  storageClassName: manual
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: Pod
metadata:
  name: app
  namespace: default
spec:
  containers:
  - name: app
    image: nginx:1.27
    volumeMounts:
    - name: data
      mountPath: /data
  volumes:
  - name: data
    persistentVolumeClaim:
      claimName: data-pvc
EOF
