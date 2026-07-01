#!/bin/bash
S=$(docker inspect -f '{{.State.Running}}' web 2>/dev/null)
[ "$S" = "true" ]
