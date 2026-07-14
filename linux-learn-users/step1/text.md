# Create a group, then a user

First make the `engineering` group:

```
groupadd engineering
```{{exec}}

Now create the `deploy` user with a home directory (`-m`), the bash shell (`-s`),
and membership in `engineering` (`-G`):

```
useradd -m -s /bin/bash -G engineering deploy
```{{exec}}

The account has no password yet, so nobody can log in as it interactively. Set one
with `passwd deploy` (interactive — skip it here), or leave it locked. Inspect what
you built:

```
id deploy
getent passwd deploy
grep '^engineering' /etc/group
```{{exec}}

Add `deploy` to a second group. `usermod -aG` **appends** — leave off the `-a` and
you'd *replace* every supplementary group the user has:

```
usermod -aG sudo deploy
id deploy
```{{exec}}

When `id deploy` lists `engineering` among its groups, press **Check**.
