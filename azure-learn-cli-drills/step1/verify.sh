#!/bin/bash
cd /root/lab || exit 1
[ -f answers.sh ] || exit 1
grep -Eq "az group create.*--name +rg-lab.*--location +eastus" answers.sh || exit 1
grep -Eq "az vm create.*--resource-group +rg-lab" answers.sh || exit 1
grep -Eq "az role assignment create.*--role +Reader" answers.sh || exit 1
