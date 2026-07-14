# Permissions beyond owner/group/other

Classic Linux permissions have only three slots: **owner**, **group**, and
**other**. That can't express "let one *extra* user in" without changing the group
or opening the file to everyone. **POSIX ACLs** add per-user and per-group rules on
top of the normal `rwx` bits.

Key commands:

- `setfacl -m u:USER:rw FILE` — grant (modify) a user's access
- `getfacl FILE` — show all ACL entries on a file
- `setfacl -x u:USER FILE` — remove a user's ACL entry
- `ls -l` marks an ACL'd file with a trailing `+`

The `deploy` user and a root-owned `/root/report.txt` are already staged. You'll
give `deploy` access without touching the group or other bits.
