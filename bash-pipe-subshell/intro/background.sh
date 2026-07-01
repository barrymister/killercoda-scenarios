#!/bin/bash
printf '1\n2\n3\n4\n5\n' > /root/nums.txt
cat > /root/tally.sh <<'SH'
#!/bin/bash
SUM=0
cat /root/nums.txt | while read n; do
  SUM=$((SUM + n))
done
echo "$SUM" > /root/tally.out
SH
rm -f /root/tally.out
