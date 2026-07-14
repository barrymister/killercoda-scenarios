# Read the network, record the gateway

Start with the compact view of every interface and its address:

```
ip -brief addr
```{{exec}}

Now look at the routing table and the link state. Note the line that starts with
`default via` — that IP is the gateway every off-subnet packet is sent to:

```
ip route
ip link
```{{exec}}

Pull the gateway out of the routing table and save it, then read it back:

```
ip route | awk '/^default/{print $3}' > /root/gateway.txt
cat /root/gateway.txt
```{{exec}}

On a real host you'd add an address temporarily with
`ip addr add 10.0.0.5/24 dev eth0` (lost on reboot), or make it permanent via
netplan on Ubuntu or `nmcli` on RHEL. We're only inspecting here — no changes to
the live interface needed.

When `/root/gateway.txt` holds your default gateway, press **Check**.
