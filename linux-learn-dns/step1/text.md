# Map a name in /etc/hosts

First look at where DNS queries would go, and confirm the resolver works on a
name that's already known locally:

```
cat /etc/resolv.conf
getent hosts localhost
```{{exec}}

Now add a static mapping and resolve it with `getent`, which honours the
`/etc/hosts`-then-DNS order:

```
echo '10.0.0.42 bench.local' >> /etc/hosts
getent hosts bench.local
```{{exec}}

`getent` returns `10.0.0.42 bench.local` because `files` comes before `dns` in
`/etc/nsswitch.conf`. Note the classic gotcha: `dig bench.local` would come back
empty, because `dig` queries DNS servers directly and never reads `/etc/hosts`.

When `getent hosts bench.local` prints the `10.0.0.42` line, press **Check**.
