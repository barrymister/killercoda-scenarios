#!/bin/bash
R=$(kubectl get deploy web -o jsonpath='{.status.availableReplicas}' 2>/dev/null)
[ -n "$R" ] && [ "$R" -ge 3 ]
