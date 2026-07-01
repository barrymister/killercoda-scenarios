#!/bin/bash
curl -s -m 5 http://localhost:8080/ 2>/dev/null | grep -q 'It works from the volume'
