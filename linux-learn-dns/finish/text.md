# Name resolution

Resolution order is `/etc/hosts` first, then the nameservers in
`/etc/resolv.conf`, with the order itself set by the `hosts:` line in
`/etc/nsswitch.conf`. `getent hosts` follows that full chain, so it's the honest
way to test what a normal program will see. `dig` and `host` skip straight to
DNS and ignore `/etc/hosts` — great for debugging DNS, but a trap when your entry
only lives in the hosts file.
