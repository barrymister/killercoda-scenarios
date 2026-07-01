#!/bin/bash
V=$(docker exec web printenv APP_ENV 2>/dev/null)
[ "$V" = "prod" ]
