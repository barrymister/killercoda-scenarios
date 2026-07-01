#!/bin/bash
id=$(docker ps -q -f name=^db$ -f status=running 2>/dev/null)
[ -n "$id" ]
