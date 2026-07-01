#!/bin/bash
P=$(kubectl get pod web -o jsonpath='{.status.phase}' 2>/dev/null)
[ "$P" = "Running" ]
