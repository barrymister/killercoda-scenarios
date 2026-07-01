#!/bin/bash
running=$(docker ps --format '{{.Names}} {{.Image}}' 2>/dev/null | grep -E '^web nginx')
[ -n "$running" ]
