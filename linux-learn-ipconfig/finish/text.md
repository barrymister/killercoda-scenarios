# IP addresses & routes

`ip addr`, `ip route`, and `ip link` are the three lenses on Linux networking —
addresses, routing, and link state. The `default via <gw>` line in the routing
table is your gateway: where packets go when the destination isn't on a local
subnet. Persistent config lives in netplan on Ubuntu or `nmcli` on RHEL; `ip addr
add` only sets an address until the next reboot. The old `ifconfig`/`route`
tools are deprecated — reach for the `ip` suite instead.
