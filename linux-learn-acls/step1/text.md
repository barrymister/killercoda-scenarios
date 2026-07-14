# Grant one user access with an ACL

Look at the file. It's owned by root, and standard permissions give `deploy` no way
in short of changing the group or opening it to everyone:

```
ls -l /root/report.txt
getfacl /root/report.txt
```{{exec}}

Grant `deploy` read+write with a single ACL entry:

```
setfacl -m u:deploy:rw /root/report.txt
```{{exec}}

Inspect it. `getfacl` now lists a `user:deploy:rw-` line, and `ls -l` shows a
trailing `+` on the permission string to signal an ACL is present:

```
getfacl /root/report.txt
ls -l /root/report.txt
```{{exec}}

To remove a specific user's entry later you'd use `setfacl -x u:deploy
/root/report.txt` (don't run it now — the check expects the ACL to be there).

When `getfacl` shows `user:deploy:rw-`, press **Check**.
