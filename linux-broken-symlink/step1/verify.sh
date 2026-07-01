#!/bin/bash
T=$(readlink -f /usr/local/bin/greet 2>/dev/null)
[ -n "$T" ] && [ -e "$T" ] && [ -f /root/greet.out ]
