#!/bin/bash
M=$(kubectl get hpa web -o jsonpath='{.spec.maxReplicas}' 2>/dev/null)
[ -n "$M" ]
