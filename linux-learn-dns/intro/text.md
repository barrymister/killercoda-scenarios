# How a name becomes an IP

When a program looks up a hostname, Linux checks sources in order: the static
table in `/etc/hosts` first, then the DNS servers listed in `/etc/resolv.conf`.
The order is set by the `hosts:` line in `/etc/nsswitch.conf` (typically
`files dns`).

Handy tools:

- `getent hosts NAME` — resolves the way real programs do (follows nsswitch order)
- `cat /etc/resolv.conf` — the `nameserver` lines your system queries
- `dig NAME` / `host NAME` — query DNS servers **directly** (they ignore `/etc/hosts`)

Nothing is pre-staged. You'll read the resolver config, add a static mapping to
`/etc/hosts`, and resolve it.
