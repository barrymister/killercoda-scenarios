# The pipe hides the change

Run it — the result is wrong:

```
bash /root/tally.sh
cat /root/tally.out
```{{exec}}

Look closely:

```
cat /root/tally.sh
```{{exec}}

`cat file | while ...` runs the loop in a **subshell** (its own process), so
`SUM` is updated there and discarded when the pipe ends. Feed the file in with a
redirect instead of a pipe, so the loop runs in the main shell:

```
sed -i 's#cat /root/nums.txt | while read n; do#while read n; do#' /root/tally.sh
sed -i 's#^done$#done < /root/nums.txt#' /root/tally.sh
bash /root/tally.sh
cat /root/tally.out
```{{exec}}

Once `/root/tally.out` is `15`, press **Check**.
