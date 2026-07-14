#!/bin/bash
grep -Eiq 'imagepull|errimage|image.*(not|missing|exist)|bad tag|tag' /root/answer.txt 2>/dev/null
