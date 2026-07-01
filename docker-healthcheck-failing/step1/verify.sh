#!/bin/bash
for i in $(seq 1 20); do
  s=$(docker inspect -f '{{.State.Health.Status}}' web 2>/dev/null)
  [ "$s" = "healthy" ] && exit 0
  sleep 1
done
exit 1
