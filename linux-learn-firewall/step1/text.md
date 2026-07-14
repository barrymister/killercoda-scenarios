# Write a default-deny ruleset

Create a ruleset file. It defines an `inet` table named `filter` with an `input`
chain whose default `policy` is `drop`, then allows exactly three things:
loopback traffic, replies to connections you started, and inbound SSH:

```
cat > /root/bench.nft <<'NFT'
table inet filter {
  chain input {
    type filter hook input priority 0; policy drop;
    iif "lo" accept
    ct state established,related accept
    tcp dport 22 accept
  }
}
NFT
```{{exec}}

Now validate the **syntax** without applying it. `-c` is check mode, `-f` reads
the file:

```
nft -c -f /root/bench.nft && echo "syntax OK"
```{{exec}}

On a real host, `nft -f /root/bench.nft` would load these rules into the kernel.
For a friendlier front-end over the same engine you'd use ufw — for example
`ufw allow 22` does the SSH rule in one line.

When `nft -c -f` prints `syntax OK`, press **Check**.
