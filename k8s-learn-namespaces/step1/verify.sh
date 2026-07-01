#!/bin/bash
N=$(kubectl get pods -n dev --no-headers 2>/dev/null | wc -l)
[ "$N" -ge 1 ]
