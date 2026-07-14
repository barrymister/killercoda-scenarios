#!/bin/bash
[ -f /root/.ssh/id_ed25519 ] && [ -f /root/.ssh/id_ed25519.pub ] && grep -qE '^Host bench' /root/.ssh/config 2>/dev/null
