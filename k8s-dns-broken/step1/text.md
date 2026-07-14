# Diagnose and fix CoreDNS

## 1. Look for the DNS pods

CoreDNS runs as pods in the `kube-system` namespace. List them:

```
kubectl get pods -n kube-system | grep coredns
```{{exec}}

There are none - every CoreDNS pod is gone. That is why name resolution fails.

## 2. Diagnose

CoreDNS is managed by a Deployment. Check its desired and available replicas:

```
kubectl get deploy coredns -n kube-system
```{{exec}}

It shows `0/0` - the Deployment has been scaled down to zero replicas, so no DNS pods exist to answer queries.

## 3. Fix

Scale CoreDNS back up to two replicas (the kubeadm default):

```
kubectl -n kube-system scale deployment coredns --replicas=2
```{{exec}}

Wait for the pods to become Ready:

```
kubectl -n kube-system rollout status deployment coredns
```{{exec}}

## 4. Verify

Confirm the Deployment reports available replicas:

```
kubectl get deploy coredns -n kube-system
```{{exec}}

When CoreDNS shows at least 1 available replica, press **Check**.
