# Define, call, use $1

Define and call a function in the shell:

```
greet() { echo "hi $1"; }
greet bench
```{{exec}}

Put it in a script that writes its output:

```
cat > /root/fn.sh <<'SH'
#!/bin/bash
greet() {
  echo "hi $1" >> /root/fn.out
}
: > /root/fn.out
greet bench
greet world
SH
bash /root/fn.sh
cat /root/fn.out
```{{exec}}

Once `/root/fn.out` contains `hi bench`, press **Check**.
