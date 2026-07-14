# The ip suite shows your network

On modern Linux, the `ip` command from `iproute2` is how you inspect and change
networking. It replaces the older `ifconfig` and `route` tools, which are
deprecated and often not even installed anymore.

Three views cover most day-to-day work:

- `ip addr` — interfaces and their IP addresses (`ip -brief addr` for a compact table)
- `ip route` — the routing table; the `default via <gw>` line is your gateway
- `ip link` — link-layer state (is the interface `UP` or `DOWN`?)

Nothing is pre-staged — the VM already has live interfaces. You'll read them,
then record the default gateway to a file so we can grade it.
