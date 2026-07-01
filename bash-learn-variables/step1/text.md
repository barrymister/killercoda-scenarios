# Set, expand, capture

Try it live first — note **no spaces** around `=`:

```
NAME=bench
echo "Hello, $NAME"
echo "Today is $(date +%A)"
```{{exec}}

Now put it in a script that writes a file:

```
cat > /root/vars.sh <<'SH'
#!/bin/bash
NAME=bench
echo "Hello, $NAME" > /root/vars.out
SH
bash /root/vars.sh
cat /root/vars.out
```{{exec}}

Once `/root/vars.out` says `Hello, bench`, press **Check**.
