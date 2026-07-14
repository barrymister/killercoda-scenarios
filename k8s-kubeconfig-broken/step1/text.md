# Diagnose and fix the kubeconfig

## 1. See the failure

Confirm kubectl really is broken:

```
kubectl get nodes
```{{exec}}

You should see a connection error mentioning `127.0.0.1:1` - kubectl is trying to reach the API server on a dead port.

## 2. Diagnose

kubectl reads its target cluster from `/root/.kube/config`. Look at the server URL it is using:

```
grep server /root/.kube/config
```{{exec}}

The URL is `https://127.0.0.1:1`, which is wrong. The real API server listens on port 6443. The kubeconfig has been corrupted.

## 3. Fix

kubeadm always leaves a pristine admin kubeconfig at `/etc/kubernetes/admin.conf`. Restore your config from it:

```
cp /etc/kubernetes/admin.conf /root/.kube/config
```{{exec}}

Now confirm the server URL points at the real API server again:

```
grep server /root/.kube/config
```{{exec}}

## 4. Verify

kubectl should work now:

```
kubectl get nodes
```{{exec}}

When `kubectl get nodes` returns the node as Ready, press **Check**.
