# Break it, then restore it

Make a bad edit and see Git flag it:

```
cd /root/repo
echo "OOPS bad edit" > config.txt
git status
git diff
```{{exec}}

You don't want that change. Throw it away and restore the committed version:

```
git restore config.txt
cat config.txt
git status
```{{exec}}

Once `config.txt` is back to "good content" and the tree is clean, press
**Check**.
