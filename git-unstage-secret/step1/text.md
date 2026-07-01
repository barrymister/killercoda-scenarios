# Unstage, ignore, verify

See what's staged:

```
cd /root/repo
git status
```{{exec}}

Unstage the secret (keeps the file on disk, just not tracked):

```
git rm --cached .env
```{{exec}}

Add a `.gitignore` so it can't be added again, then commit the safe files:

```
echo ".env" > .gitignore
git add README.md .gitignore
git commit -m "Add project, ignore .env"
git status
```{{exec}}

Once `.env` is untracked and ignored, press **Check**.
