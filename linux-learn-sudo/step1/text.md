# Grant sudo with a drop-in

Write a drop-in rule that lets `deploy` run any command as root without a password
prompt:

```
echo 'deploy ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/deploy
```{{exec}}

Set the required permissions. sudo ignores drop-ins that are group- or
world-writable, so `440` (read for owner and group, nothing else) is the norm:

```
chmod 440 /etc/sudoers.d/deploy
```{{exec}}

Now **validate** the syntax. `visudo -cf` parses the file and reports errors without
saving anything — this is the safety net that stops a typo from breaking sudo for
the whole machine:

```
visudo -cf /etc/sudoers.d/deploy
```{{exec}}

When it prints `parsed OK`, press **Check**. (`NOPASSWD` skips the password prompt —
convenient for automation, but for a human account you'd usually drop it so sudo
asks for a password each time.)
