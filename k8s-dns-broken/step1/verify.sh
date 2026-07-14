#!/bin/bash
R=$(kubectl -n kube-system get deploy coredns -o jsonpath='{.status.availableReplicas}' 2>/dev/null)
[ -n "$R" ] && [ "$R" -ge 1 ]
