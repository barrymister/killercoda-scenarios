# Your first commit

Turn the folder into a repo:

```
cd /root/repo
git init
```{{exec}}

Create a file and check what Git sees:

```
echo "# My Project" > README.md
git status
```{{exec}}

Stage it, then commit:

```
git add README.md
git commit -m "Initial commit"
```{{exec}}

Confirm the history:

```
git log --oneline
```{{exec}}

Once the repo has a commit, press **Check**.
