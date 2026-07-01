#!/bin/bash
docker run --rm myapp 2>/dev/null | grep -q 'hello from myapp'
