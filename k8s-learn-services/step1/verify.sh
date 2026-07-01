#!/bin/bash
EP=$(kubectl get endpoints web -o jsonpath='{.subsets[0].addresses[0].ip}' 2>/dev/null)
[ -n "$EP" ]
