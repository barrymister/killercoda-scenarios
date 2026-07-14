#!/bin/bash
mkdir -p /root/work
touch '/root/work/keep me.txt' /root/work/a.tmp /root/work/b.tmp /root/work/important.txt
cat > /root/clean.sh <<'SH'
#!/bin/bash
DIR=/root/work
PATTERN=*.tmp
# BUG: unquoted $PATTERN and no cd; glob expands in the wrong place / files with spaces break
rm $DIR/$PATTERN
SH
chmod +x /root/clean.sh
