# Resolve, add, commit

See the paused merge and the conflict markers:

```
cd /root/repo
git status
cat site.txt
```{{exec}}

The `<<<<<<<`, `=======`, `>>>>>>>` lines wrap the two versions. Keep the `green`
line and delete the markers — here's a scripted resolve:

```
printf 'title: Home\ncolor: green\n' > site.txt
grep -c '<<<<<<<' site.txt
```{{exec}}

Mark it resolved and finish the merge:

```
git add site.txt
git commit --no-edit
git status
```{{exec}}

Once the merge is complete and the markers are gone, press **Check**.
