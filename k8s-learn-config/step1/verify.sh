#!/bin/bash
V=$(kubectl get configmap app-config -o jsonpath='{.data.GREETING}' 2>/dev/null)
[ -n "$V" ]
