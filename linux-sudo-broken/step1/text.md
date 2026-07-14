# Let visudo find the bad line

Never guess at sudoers syntax — there's a checker built in. Ask it to validate
the whole configuration:

```
visudo -c
```{{exec}}

It reports the offending file and line number. Open that file and read it:

```
cat /etc/sudoers.d/deploy
```{{exec}}

Spot the typo: it says `NOPASWD` — the valid tag is `NOPASSWD` (two S's). A
single misspelled keyword anywhere under `/etc/sudoers.d/` breaks sudo for
everyone.

Rewrite the line correctly. The safe way is `visudo -f`, which refuses to save a
file that doesn't parse:

```
EDITOR='sed -i s/NOPASWD/NOPASSWD/' visudo -f /etc/sudoers.d/deploy
```{{exec}}

(If you prefer, just overwrite it directly:
`printf 'deploy ALL=(ALL) NOPASSWD:ALL\n' > /etc/sudoers.d/deploy`.)

Re-run the checker until it comes back clean:

```
visudo -c
```{{exec}}

When `visudo -c` reports everything parsed OK, press **Check**.
