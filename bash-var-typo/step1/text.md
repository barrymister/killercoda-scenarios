# Find the misspelled variable

Reproduce it, then read the script:

```
bash /root/copy.sh
cat /root/copy.sh
```{{exec}}

It sets `SOURCE_DIR` but uses `$SOURC_DIR` — a typo. An unset variable expands to
nothing, so the path became `/app.txt`. Fix the name and re-run:

```
sed -i 's/\$SOURC_DIR/$SOURCE_DIR/' /root/copy.sh
bash /root/copy.sh
ls -l /root/dest/
```{{exec}}

Once `/root/dest/app.txt` exists, press **Check**.
