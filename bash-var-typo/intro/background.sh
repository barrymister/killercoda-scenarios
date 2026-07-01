#!/bin/bash
mkdir -p /root/src /root/dest
echo "hello" > /root/src/app.txt
cat > /root/copy.sh <<'SH'
#!/bin/bash
SOURCE_DIR=/root/src
DEST_DIR=/root/dest
cp "$SOURC_DIR/app.txt" "$DEST_DIR/app.txt"
SH
rm -f /root/dest/app.txt
