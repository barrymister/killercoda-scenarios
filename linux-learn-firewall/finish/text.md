# Firewall rules (nftables)

nftables nests as table → chain → rule. A chain with `type filter hook input` and
`policy drop` is default-deny: you then accept only what you trust — loopback
(`iif "lo"`), replies to your own connections (`ct state established,related`),
and the specific ports you serve (`tcp dport 22` for SSH). `nft -c -f` checks
syntax without touching the kernel; `nft -f` applies it. ufw and firewalld are
friendlier front-ends that generate rules over the same netfilter engine.
