#!/bin/bash
getent hosts bench.local 2>/dev/null | grep -q '^10\.0\.0\.42'
