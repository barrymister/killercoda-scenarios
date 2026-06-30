#!/bin/bash
until kubectl get nodes 2>/dev/null | grep -qw Ready; do sleep 2; done
kubectl create deployment web --image=nginx:thistagdoesnotexist123 >/dev/null 2>&1
