#!/bin/bash
getfacl /root/report.txt 2>/dev/null | grep -qE '^user:deploy:rw'
