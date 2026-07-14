#!/bin/bash
until kubectl get nodes 2>/dev/null | grep -qw Ready; do sleep 2; done
# Warmup done - cluster is Ready. Now introduce the fault.
# Scale CoreDNS to zero so in-cluster DNS stops answering.
kubectl -n kube-system scale deployment coredns --replicas=0 >/dev/null 2>&1
