#!/bin/bash
[ -f /root/build.done ] && ! grep -q $'\r' /root/build.sh
