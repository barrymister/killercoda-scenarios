#!/bin/bash
getent hosts api.bench.local 2>/dev/null | grep -q '^10\.0\.0\.50'
