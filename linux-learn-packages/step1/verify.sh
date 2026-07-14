#!/bin/bash
dpkg-query -W -f='${Status}' tree 2>/dev/null | grep -q 'install ok installed'
