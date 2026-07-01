#!/bin/bash
cat > /root/run.sh <<'SH'
#!/bin/bash
echo "script ran" > /root/ran.marker
SH
chmod 644 /root/run.sh
