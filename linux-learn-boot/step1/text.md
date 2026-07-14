# Read, inspect, and fix the default target

First see where this box is set to boot. It was switched to `rescue.target`:

```
systemctl get-default
```{{exec}}

List the target units that are active right now:

```
systemctl list-units --type=target --no-pager
```{{exec}}

Look at what happened during this boot. `-b` limits the journal to the current
boot; `-b -1` would show the previous one:

```
journalctl -b --no-pager | tail
```{{exec}}

Now set the default back to a normal headless boot:

```
systemctl set-default multi-user.target
```{{exec}}

When `systemctl get-default` prints `multi-user.target`, press **Check**.
