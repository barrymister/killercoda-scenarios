#!/bin/bash
mkdir -p /var/log
printf 'line %s\n' 1 2 3 > /var/log/benchapp.log
