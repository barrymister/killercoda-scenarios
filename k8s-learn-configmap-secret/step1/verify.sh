#!/bin/bash
C=$(kubectl exec cfgpod -- printenv COLOR 2>/dev/null)
T=$(kubectl exec cfgpod -- printenv TOKEN 2>/dev/null)
[ "$C" = "blue" ] && [ "$T" = "s3cr3t" ]
