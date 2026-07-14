#!/bin/bash
want=$(ip route 2>/dev/null | awk '/^default/{print $3; exit}')
[ -n "$want" ] && grep -qx "$want" /root/gateway.txt 2>/dev/null
