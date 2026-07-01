# Branch here, rewind main

Confirm the stray commit is the tip of `main`:

```
cd /root/repo
git log --oneline -3
```{{exec}}

Create a `feature` branch pointing at the current commit (this saves the work):

```
git branch feature
```{{exec}}

Now move `main` back one commit — the work stays safe on `feature`:

```
git reset --hard HEAD~1
git log --oneline -3
```{{exec}}

Check the split: `main` no longer has `feature.txt`, but `feature` does:

```
ls
git show feature:feature.txt
```{{exec}}

Once `feature.txt` is off `main` but on `feature`, press **Check**.
