#!/bin/bash
[ -f /root/data.tar.gz ] && tar tzf /root/data.tar.gz >/dev/null 2>&1 && [ -f /root/restore/data/a.txt ]
