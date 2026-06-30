#!/bin/bash
IPS=$(kubectl get endpoints web -o jsonpath='{.subsets[*].addresses[*].ip}' 2>/dev/null)
[ -n "$IPS" ]
