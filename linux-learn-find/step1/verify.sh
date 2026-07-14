#!/bin/bash
grep -q '/root/proj/logs/big.log' /root/found.txt 2>/dev/null && grep -q '/root/proj/logs/old.log' /root/found.txt 2>/dev/null
