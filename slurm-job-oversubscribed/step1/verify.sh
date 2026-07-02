#!/bin/bash
[ -f /root/train.out ] && grep -q "training done" /root/train.out
