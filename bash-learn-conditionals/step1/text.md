# Test, branch, read $?

Watch exit codes — 0 means success:

```
ls /etc/hostname ; echo "exit: $?"
ls /nope 2>/dev/null ; echo "exit: $?"
```{{exec}}

Write a script that branches on whether a file exists:

```
cat > /root/check.sh <<'SH'
#!/bin/bash
if [ -f /etc/hostname ]; then
  echo "yes" > /root/check.out
else
  echo "no" > /root/check.out
fi
SH
bash /root/check.sh
cat /root/check.out
```{{exec}}

Once `/root/check.out` says `yes`, press **Check**.
