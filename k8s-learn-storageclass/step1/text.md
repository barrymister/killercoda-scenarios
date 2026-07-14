# Create a StorageClass

A StorageClass has three key fields: `provisioner` (which plugin creates volumes), `volumeBindingMode` (when a volume is bound to a claim), and `reclaimPolicy` (what happens to a volume when its claim is deleted).

Create a StorageClass named `fast`:

```
cat <<'EOF' | kubectl apply -f -
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: fast
provisioner: kubernetes.io/no-provisioner
volumeBindingMode: WaitForFirstConsumer
reclaimPolicy: Delete
EOF
```{{exec}}

The `WaitForFirstConsumer` mode delays binding until a Pod actually uses the claim, which lets the scheduler pick a node before a volume is placed.

List the StorageClasses to confirm `fast` is present:

```
kubectl get sc
```{{exec}}

You can inspect the full definition too:

```
kubectl describe sc fast
```{{exec}}

When the `fast` StorageClass appears in the list, press **Check**.
