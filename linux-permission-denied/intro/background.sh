#!/bin/bash
cat > /root/deploy.sh <<'SH'
#!/bin/bash
echo "deployed $(date)" > /root/deploy.done
SH
chmod 640 /root/deploy.sh
rm -f /root/deploy.done
