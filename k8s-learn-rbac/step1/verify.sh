#!/bin/bash
kubectl auth can-i list pods --as=system:serviceaccount:default:reader -n default 2>/dev/null | grep -qx yes
