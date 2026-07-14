# Find the biggest directory

Start with the big picture — free space on every mounted filesystem:

```
df -h
```{{exec}}

Now drill into `/var`. `--max-depth=1` totals each immediate subdirectory, and
`sort -rh` puts the biggest at the top:

```
du -h --max-depth=1 /var 2>/dev/null | sort -rh | head
```{{exec}}

The clear winner is `/var/lib/benchbig`. Confirm its total on its own, then record
it as your answer:

```
du -sh /var/lib/benchbig
echo /var/lib/benchbig > /root/answer.txt
```{{exec}}

`du -sh DIR` gives a single directory's total — handy for a quick check. For
capping usage *per user* rather than just measuring it, Linux uses disk **quotas**
(`quota` to view, `edquota` to set limits).

When `/root/answer.txt` names the culprit, press **Check**.
