# Resolve the name the way the system does

`getent hosts` looks a name up through the system's real resolution order (the
`hosts:` line in `/etc/nsswitch.conf` — usually **files first, then DNS**). Try
the name that's failing:

```
getent hosts api.bench.local
```{{exec}}

Nothing comes back. Since this name was meant to be pinned in the local hosts
file, look there:

```
cat /etc/hosts
```{{exec}}

There's the bug — the entry reads `api.bench.locaal` (a typo), so the correct
name `api.bench.local` never matches. Fix the misspelled hostname in place:

```
sed -i 's/api\.bench\.locaal/api.bench.local/' /etc/hosts
cat /etc/hosts
```{{exec}}

Confirm the name now resolves to the right address:

```
getent hosts api.bench.local
```{{exec}}

Once `getent hosts api.bench.local` returns `10.0.0.50`, press **Check**.
