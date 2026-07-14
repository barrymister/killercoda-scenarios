# Search by name, size, and age

Try the filters one at a time so you can see what each matches:

```
find /root/proj -name '*.log'
find /root/proj -size +1M
find /root/proj -mtime +7
find /root/proj -name '*.log' -type f
```{{exec}}

`-name` matches the filename, `-size +1M` finds files over a megabyte (`big.log`),
`-mtime +7` finds files older than seven days (`old.log`), and `-type f` keeps only
regular files. Filters combine — all of them must be true.

Now **act** on the results. Save the matching `.log` files, sorted, to a file:

```
find /root/proj -name '*.log' | sort > /root/found.txt
cat /root/found.txt
```{{exec}}

To run a command per match you'd use `-exec grep x {} \;` (the `{}` is each file,
`\;` ends the command), or pipe to `xargs`. For names with spaces, pair
`find -print0` with `xargs -0` so entries are split on NUL instead of whitespace:

```
find /root/proj -name '*.log' -print0 | xargs -0 ls -l
```{{exec}}

When `/root/found.txt` lists both `big.log` and `old.log`, press **Check**.
