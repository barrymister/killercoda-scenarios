#!/bin/bash
H=$(kubectl get ingress web-ing -o jsonpath='{.spec.rules[0].host}' 2>/dev/null)
[ "$H" = "demo.local" ]
