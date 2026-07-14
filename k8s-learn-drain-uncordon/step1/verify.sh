#!/bin/bash
U=$(kubectl get nodes -o jsonpath='{.items[0].spec.unschedulable}' 2>/dev/null)
[ "$U" != "true" ]
