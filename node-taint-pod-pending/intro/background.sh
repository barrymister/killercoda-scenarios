#!/bin/bash
until kubectl get nodes 2>/dev/null | grep -qw Ready; do sleep 2; done
NODE=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
kubectl taint nodes "$NODE" dedicated=team-a:NoSchedule --overwrite >/dev/null 2>&1
kubectl create deployment web --image=nginx:1.27 >/dev/null 2>&1
