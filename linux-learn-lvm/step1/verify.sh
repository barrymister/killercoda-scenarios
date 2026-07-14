#!/bin/bash
lvs --noheadings -o lv_name benchvg 2>/dev/null | grep -qw data
