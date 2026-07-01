#!/bin/bash
id=$(docker ps -q -f name=^app$ -f status=running 2>/dev/null)
[ -n "$id" ]
