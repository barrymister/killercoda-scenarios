#!/bin/bash
printf 'a\nb\nc\nd\ne\n' > /root/items.txt
cat > /root/check.sh <<'SH'
#!/bin/bash
COUNT=$(wc -l < /root/items.txt)
if [$COUNT -gt 3]
then
  echo "many" > /root/verdict.out
else
  echo "few" > /root/verdict.out
fi
SH
rm -f /root/verdict.out
