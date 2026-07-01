#!/bin/bash
cat > /root/hog.sh <<'SH'
#!/bin/bash
while true; do :; done
SH
chmod +x /root/hog.sh
nohup /root/hog.sh >/dev/null 2>&1 &
