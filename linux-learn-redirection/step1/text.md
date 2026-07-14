# Split the streams, then merge them

`ls /root /nope` writes a normal listing (stdout) **and** an error about the missing
path (stderr). Send each to its own file:

```
ls /root /nope >/root/out.txt 2>/root/err.txt
cat /root/out.txt
cat /root/err.txt
```{{exec}}

`out.txt` has the good listing, `err.txt` has the error. To capture **both** in one
file, merge stderr into stdout's destination with `2>&1` — order matters, the
redirect to the file must come first:

```
ls /root /nope >/root/all.txt 2>&1
cat /root/all.txt
```{{exec}}

`tee` writes to a file *and* passes the text through to the screen:

```
echo hello | tee /root/tee.txt
```{{exec}}

Finally, write a config file with a **here-doc** — everything between the markers
becomes the command's stdin. Quoting `'EOF'` keeps the text literal:

```
cat > /root/config.ini <<'EOF'
[bench]
mode=learn
EOF
```{{exec}}

When `/root/tee.txt` contains `hello` and `/root/config.ini` has `mode=learn`, press
**Check**.
