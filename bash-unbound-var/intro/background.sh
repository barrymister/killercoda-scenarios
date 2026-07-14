#!/bin/bash
cat > /root/deploy.sh <<'SH'
#!/bin/bash
set -euo pipefail
TARGET_DIR=/root/out
mkdir -p "$TARGET_DIR"
# BUG: variable typo -- TARGET_DIR set above but TARGE_DIR used here
echo "deploying to $TARGE_DIR" > "$TARGET_DIR/log.txt"
echo "ok"
SH
chmod +x /root/deploy.sh
