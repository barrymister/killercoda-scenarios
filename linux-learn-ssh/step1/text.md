# Generate a key and a host alias

Create an ed25519 keypair non-interactively. `-N ''` sets an empty passphrase and
`-f` names the output file, so it won't prompt:

```
mkdir -p /root/.ssh
ssh-keygen -t ed25519 -N '' -f /root/.ssh/id_ed25519
```{{exec}}

Authorize the public half by appending it to `authorized_keys`, and lock the file
down to owner-only:

```
cat /root/.ssh/id_ed25519.pub >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys
```{{exec}}

Add a client `Host` block so `ssh bench` expands to the full connection. `chmod
600` keeps SSH from rejecting a world-readable config:

```
cat >> /root/.ssh/config <<'CFG'
Host bench
    HostName 10.0.0.10
    User deploy
    IdentityFile ~/.ssh/id_ed25519
CFG
chmod 600 /root/.ssh/config
```{{exec}}

To harden the **server** side you'd edit `/etc/ssh/sshd_config` and set
`PasswordAuthentication no` and `PermitRootLogin no`, then reload sshd — shown
here, not graded.

When the keypair exists and `~/.ssh/config` has the `Host bench` block, press
**Check**.
