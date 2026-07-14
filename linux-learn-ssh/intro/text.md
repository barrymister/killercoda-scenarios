# SSH keys beat passwords

SSH key auth uses a **keypair**: a private key that never leaves the client, and
a public key you copy to the server. The server stores allowed public keys in
`~/.ssh/authorized_keys`; a login succeeds if the client proves it holds the
matching private key. No password crosses the wire.

Tools and files:

- `ssh-keygen -t ed25519` — generate a modern keypair (`.pub` is the public half)
- `~/.ssh/authorized_keys` — public keys the server accepts (mode `600`)
- `~/.ssh/config` — client-side `Host` aliases so `ssh bench` fills in the details

Nothing is pre-staged. You'll generate a key, authorize it, and write a client
config block.
