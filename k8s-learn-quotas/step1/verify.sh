#!/bin/bash
H=$(kubectl get resourcequota -n team-a -o jsonpath='{.items[0].status.hard.pods}' 2>/dev/null)
[ -n "$H" ]
