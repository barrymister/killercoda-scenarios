#!/bin/bash
kubectl get pods -A 2>/dev/null | grep -q staticweb
