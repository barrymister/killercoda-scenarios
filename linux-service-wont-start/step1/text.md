# Ask systemd why it died

The first two moves for any dead service are always the same: read its status,
then read its log.

```
systemctl status bench.service --no-pager
```{{exec}}

```
journalctl -u bench.service --no-pager
```{{exec}}

Look for `status=203/EXEC`. That code means systemd tried to run `ExecStart` but
the binary is **missing or not executable**. Confirm the path it wants:

```
grep ExecStart /etc/systemd/system/bench.service
ls -l /usr/local/bin/bench-daemon
```{{exec}}

The file doesn't exist. Provide the missing program (a tiny script that just
stays alive is enough here), make it executable, then start the service:

```
printf '#!/bin/bash\nexec sleep infinity\n' > /usr/local/bin/bench-daemon
chmod +x /usr/local/bin/bench-daemon
systemctl start bench.service
```{{exec}}

Confirm it's up:

```
systemctl is-active bench.service
```{{exec}}

(If you edit the unit file itself instead — for example to fix the `ExecStart`
path — remember to run `systemctl daemon-reload` before starting.)

Once `bench.service` is active, press **Check**.
