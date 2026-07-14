#!/bin/bash
size=$(lvs --noheadings --nosuffix --units m -o lv_size appvg/app 2>/dev/null | tr -d ' ' | cut -d. -f1)
[ -n "$size" ] && [ "$size" -gt 150 ]
