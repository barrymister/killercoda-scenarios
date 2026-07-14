# Firewalls with nftables

A firewall decides which packets the kernel accepts or drops. On modern Linux
that engine is **nftables** (`nft`), the successor to iptables. Its structure is
three layers:

- **table** — a container for a protocol family (`inet` covers IPv4 + IPv6)
- **chain** — attached to a hook like `input`; it carries a default `policy`
- **rule** — a match plus a verdict (`accept` / `drop`)

Key ideas:

- `policy drop` on the input chain = default-deny — nothing gets in unless a rule
  explicitly allows it (the allowlist model)
- `nft -c -f FILE` checks a ruleset's **syntax** without loading it; `nft -f FILE`
  actually applies it

`nftables` is installed for you. You'll write a ruleset file and validate it in
check mode — no live packet filtering, which containers restrict.
