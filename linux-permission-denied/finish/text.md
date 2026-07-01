# Executable again

"Permission denied" on a script you can see is almost always a missing execute
bit. `ls -l` shows it, `chmod +x` (or `chmod 750`) grants it. If it persists,
check the *owner* (`chown`) and whether the filesystem is mounted `noexec`.
