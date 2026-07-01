#!/bin/bash
mkdir -p /opt/tools
cat > /opt/tools/greet.sh <<'SH'
#!/bin/bash
echo "hello from greet" > /root/greet.out
SH
chmod +x /opt/tools/greet.sh
# The symlink points at the WRONG name (no .sh) -> dangling.
ln -sf /opt/tools/greet /usr/local/bin/greet
rm -f /root/greet.out
