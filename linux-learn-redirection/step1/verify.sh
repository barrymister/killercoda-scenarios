#!/bin/bash
grep -q 'hello' /root/tee.txt 2>/dev/null && grep -q '^mode=learn' /root/config.ini 2>/dev/null
