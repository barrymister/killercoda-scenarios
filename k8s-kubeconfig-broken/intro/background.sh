#!/bin/bash
until kubectl get nodes 2>/dev/null | grep -qw Ready; do sleep 2; done
# Warmup done - cluster is Ready. Now introduce the fault.
# Back up the working kubeconfig, then corrupt the server URL so it points at a dead port.
cp /root/.kube/config /root/kube.bak 2>/dev/null
sed -i 's#server: https://.*#server: https://127.0.0.1:1#' /root/.kube/config
