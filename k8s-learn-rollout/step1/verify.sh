#!/bin/bash
IMG=$(kubectl get deploy web -o jsonpath='{.spec.template.spec.containers[0].image}' 2>/dev/null)
[ "$IMG" = "nginx:1.27" ]
