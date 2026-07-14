#!/bin/bash
cat > /root/count.sh <<'SH'
#!/bin/bash
# Should print 1..5 then stop, but it hangs.
i=1
while [ "$i" -le 5 ]; do
  echo "count $i"
  # BUG: i is never incremented, so the condition stays true forever
done
SH
chmod +x /root/count.sh
