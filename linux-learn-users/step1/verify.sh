#!/bin/bash
id -nG deploy 2>/dev/null | tr ' ' '\n' | grep -qx engineering
