# Find why it never terminates

Read the script first — do **not** run it unguarded:

```
cat /root/count.sh
```{{exec}}

The loop tests `[ "$i" -le 5 ]`, but nothing inside the body ever changes `$i`.
It starts at `1` and stays `1`, so the condition is always true and the loop
spins forever, printing `count 1` endlessly. The fix: increment `i` at the end of
the loop body so it climbs toward the exit condition.

```
sed -i 's/^  # BUG.*/  i=$((i+1))/' /root/count.sh
cat /root/count.sh
```{{exec}}

Now run it, capturing output to a file so it can be graded:

```
bash /root/count.sh > /root/count.out
cat /root/count.out
```{{exec}}

Once it prints `count 1` through `count 5` and exits, press **Check**.
