#!/bin/bash
docker port web 2>/dev/null | grep -q '8080'
