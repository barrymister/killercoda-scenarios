# POSIX ACLs

ACLs add per-user and per-group permissions on top of the classic `rwx` bits.
`setfacl -m u:USER:rw FILE` grants access, `getfacl FILE` lists every entry, and
`setfacl -x u:USER FILE` removes one. A file that carries an ACL shows a trailing
`+` in `ls -l`. Reach for ACLs when owner/group/other isn't granular enough — for
example, letting exactly one extra account into a file without widening it to a
whole group.
