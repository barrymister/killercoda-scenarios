# Loop over a range

A quick `for` loop in the shell:

```
for i in 1 2 3; do echo "line $i"; done
```{{exec}}

Now loop to create five files:

```
mkdir -p /root/data
for i in $(seq 1 5); do
  echo "record $i" > /root/data/file$i.txt
done
ls -1 /root/data
```{{exec}}

Once `/root/data` has five files, press **Check**.
