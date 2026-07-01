# Follow the link, then fix it

`greet` is found, but broken:

```
which greet
greet
```{{exec}}

Follow the symlink — it points at a file that doesn't exist:

```
ls -l /usr/local/bin/greet
readlink -f /usr/local/bin/greet
ls -l /opt/tools/
```{{exec}}

The real script is `greet.sh`, not `greet`. Repoint the symlink:

```
ln -sf /opt/tools/greet.sh /usr/local/bin/greet
greet
cat /root/greet.out
```{{exec}}

Once `greet` runs, press **Check**.
