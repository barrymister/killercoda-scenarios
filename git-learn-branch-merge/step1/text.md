# Branch, commit, merge

Make a feature branch and switch to it:

```
cd /root/repo
git switch -c feature
```{{exec}}

Add a commit on the branch:

```
echo "line two" >> app.txt
git commit -am "add line two"
```{{exec}}

Switch back to `main` and merge the branch in:

```
git switch main
git merge feature
cat app.txt
```{{exec}}

Once `main` contains "line two", press **Check**.
