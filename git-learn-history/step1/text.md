# log, show, diff

See the history, most recent first:

```
cd /root/repo
git log --oneline
```{{exec}}

Open the latest commit, and compare the first commit to now:

```
git show HEAD
git diff HEAD~2 HEAD -- notes.txt
```{{exec}}

Save the one-line history to a file:

```
git log --oneline > /root/history.out
cat /root/history.out
```{{exec}}

Once `/root/history.out` holds the commit list, press **Check**.
