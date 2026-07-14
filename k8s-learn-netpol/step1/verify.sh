#!/bin/bash
S=$(kubectl get netpol api-allow -o jsonpath='{.spec.podSelector.matchLabels.app}' 2>/dev/null)
[ "$S" = "api" ]
