#!/bin/bash
cat > /usr/local/bin/bench-daemon <<'SH'
#!/bin/bash
exec sleep infinity
SH
chmod +x /usr/local/bin/bench-daemon
