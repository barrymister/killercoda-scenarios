# SSH keys & client config

Key auth splits into two halves: the public key goes in the server's
`~/.ssh/authorized_keys`, the private key stays on the client and is never
shared. `ssh-keygen -t ed25519` makes a modern, compact keypair. A `Host` block
in `~/.ssh/config` aliases the hostname, user, and identity file so `ssh bench`
just works. Lock `~/.ssh` files to mode `600`, and harden the server with
`PasswordAuthentication no` and `PermitRootLogin no` in `/etc/ssh/sshd_config`.
