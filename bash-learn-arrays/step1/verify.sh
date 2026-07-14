#!/bin/bash
grep -qx 'count=3' /root/arr.out 2>/dev/null && grep -qx 'second=banana' /root/arr.out 2>/dev/null
