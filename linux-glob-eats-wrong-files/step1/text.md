# Read the script, then make it safe

First see what you're starting with:

```
cat /root/clean.sh
ls -l /root/work
```{{exec}}

The bug is on the `rm $DIR/$PATTERN` line. `PATTERN=*.tmp` stores the literal
text `*.tmp`, and the unquoted `$DIR/$PATTERN` is left to word-split and glob at
`rm` time. On filenames with spaces (`keep me.txt`) that word-splitting breaks
`rm` into the wrong arguments, and if nothing matches, the raw `*.tmp` can be
passed through literally.

The robust pattern is to loop over the glob directly, quote every expansion, and
use `--` so a filename can't be read as an option. `shopt -s nullglob` makes an
empty match expand to nothing instead of a literal `*.tmp`. Overwrite the script:

```
cat > /root/clean.sh <<'SH'
#!/bin/bash
DIR=/root/work
shopt -s nullglob
for f in "$DIR"/*.tmp; do
  rm -- "$f"
done
SH
```{{exec}}

Run it, then confirm the `.tmp` files are gone and the real files remain:

```
bash /root/clean.sh
ls -l /root/work
```{{exec}}

You should see `keep me.txt` and `important.txt` still there, with `a.tmp` and
`b.tmp` gone. Then press **Check**.
