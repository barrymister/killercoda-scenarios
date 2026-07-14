#!/bin/bash
useradd -m deploy >/dev/null 2>&1 || true
printf 'deploy ALL=(ALL) NOPASWD:ALL\n' > /etc/sudoers.d/deploy
chmod 440 /etc/sudoers.d/deploy
