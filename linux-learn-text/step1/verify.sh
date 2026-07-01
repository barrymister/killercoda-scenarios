#!/bin/bash
[ -s /root/errors.txt ] && grep -q " 500 " /root/errors.txt
