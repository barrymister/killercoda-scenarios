#!/bin/bash
git -C /root/repo show main:app.txt 2>/dev/null | grep -q "line two"
