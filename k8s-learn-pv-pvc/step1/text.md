# Create a PV, a PVC, and a Pod that mounts it

First create a hostPath PersistentVolume named `data-pv`. It offers 1Gi of storage, ReadWriteOnce access, and uses the `manual` storage class so a matching claim can bind to it.

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

Now create a PersistentVolumeClaim named `data-pvc`. It asks for 1Gi with ReadWriteOnce from the `manual` class, so Kubernetes binds it to `data-pv`.

```
cat <<'EOF' | kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: data-pvc
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: manual
  resources:
    requests:
      storage: 1Gi
EOF
```{{exec}}

Optionally create a Pod that mounts the claim at /data:

```
cat <<'EOF' | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: pv-user
spec:
  containers:
    - name: app
      image: nginx
      volumeMounts:
        - name: store
          mountPath: /data
  volumes:
    - name: store
      persistentVolumeClaim:
        claimName: data-pvc
EOF
```{{exec}}

Check that the claim has bound to the volume:

```
kubectl get pvc data-pvc
```{{exec}}

When the `data-pvc` claim shows STATUS Bound, press **Check**.
