# Find the misspelled variable

Reproduce the failure, then read the script:

```
bash /root/deploy.sh
cat /root/deploy.sh
```{{exec}}

It fails with `TARGE_DIR: unbound variable`. The script sets `TARGET_DIR` but the
`echo` line references `$TARGE_DIR` — a typo (missing the `T`). Because `set -u`
is active, referencing that never-set variable is a hard error instead of a
silent empty expansion. That's strict mode earning its keep: it caught the typo
before it could write a broken path.

Fix the name and re-run:

```
sed -i 's/\$TARGE_DIR/$TARGET_DIR/' /root/deploy.sh
bash /root/deploy.sh
cat /root/out/log.txt
```{{exec}}

Once it prints `ok` and `/root/out/log.txt` says `deploying to /root/out`, press
**Check**.
