#!/bin/bash
cat > /root/access.log <<'LOG'
200 GET /
200 GET /about
404 GET /missing
500 GET /api/users
200 GET /contact
404 GET /nope
500 GET /api/orders
LOG
