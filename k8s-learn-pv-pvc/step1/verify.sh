#!/bin/bash
P=$(kubectl get pvc data-pvc -o jsonpath='{.status.phase}' 2>/dev/null)
[ "$P" = "Bound" ]
