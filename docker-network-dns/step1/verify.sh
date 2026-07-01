#!/bin/bash
docker exec app nslookup db >/dev/null 2>&1
