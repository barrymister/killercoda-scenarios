#!/bin/bash
[ "$(ls -1 /root/data 2>/dev/null | wc -l)" -ge 5 ]
