# Users and groups

Every Linux account is a **user** with an ID, a home directory, and a login shell.
**Groups** bundle users together so you can grant permissions to many at once. You
create and modify them from the shell.

Key commands:

- `groupadd NAME` — create a group
- `useradd -m -s /bin/bash -G GROUP NAME` — create a user with a home, a shell, and a supplementary group
- `usermod -aG GROUP NAME` — **add** a user to another group (the `-a` is required)
- `id NAME` / `getent passwd NAME` — inspect who a user is and which groups they're in

Nothing is pre-created — you'll build the group and the user from scratch.
