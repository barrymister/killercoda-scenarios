#!/bin/bash
P=$(kubectl get pod tolerant -o jsonpath='{.status.phase}' 2>/dev/null)
[ "$P" = "Running" ]
