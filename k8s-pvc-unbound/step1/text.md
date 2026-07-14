# Diagnose and fix the unbound PVC

## 1. See the stuck pod

```
kubectl get pod app
```{{exec}}

It is stuck in Pending / ContainerCreating. Look at why:

```
kubectl describe pod app | tail -n 15
```{{exec}}

The events mention that the pod cannot use its volume because the PVC is not bound.

## 2. Diagnose

Check the claim:

```
kubectl get pvc data-pvc
```{{exec}}

It is `Pending`. Ask why it has not bound:

```
kubectl describe pvc data-pvc
```{{exec}}

The claim wants `storageClassName: manual`, `ReadWriteOnce`, and `1Gi`, but there is no PersistentVolume that matches, so it waits forever.

## 3. Fix

Create a PersistentVolume that satisfies the claim - same storage class, same access mode, at least the requested size:

```
cat <<'EOF' | kubectl apply -f -
apiVersion: v1
kind: PersistentVolume
metadata:
  name: data-pv
spec:
  capacity:
    storage: 1Gi
  accessModes:
  - ReadWriteOnce
  storageClassName: manual
  hostPath:
    path: /mnt/data
EOF
```{{exec}}

## 4. Verify

The claim should now bind to the new PV:

```
kubectl get pvc data-pvc
```{{exec}}

When `data-pvc` shows `Bound`, press **Check**.
