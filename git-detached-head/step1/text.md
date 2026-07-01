# Rescue the commit

Confirm the situation — HEAD isn't a branch, but the hotfix is here:

```
cd /root/repo
git status
git log --oneline -3
```{{exec}}

Park this exact state on a temporary branch so it can't be lost:

```
git branch rescue
```{{exec}}

Switch to `main` and bring the hotfix in:

```
git switch main
git merge rescue
git log --oneline -3
cat hotfix.txt
```{{exec}}

Once you're back on `main` and it contains the hotfix, press **Check**.
