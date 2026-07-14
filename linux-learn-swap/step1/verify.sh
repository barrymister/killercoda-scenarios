#!/bin/bash
swapon --show=NAME --noheadings 2>/dev/null | grep -q '/swapfile'
