# Find the auth failure, restart munge

Try a normal command and read the error:

```
squeue
```{{exec}}

An error mentioning *munge* / *credential* / *auth* points at the munge daemon.
Check it:

```
systemctl status munge --no-pager 2>/dev/null | head -5
munge -n | unmunge 2>&1 | head -3
```{{exec}}

Start munge back up (then Slurm can authenticate again):

```
systemctl start munge 2>/dev/null || munged --force
sleep 1
```{{exec}}

Prove Slurm works again:

```
munge -n | unmunge | grep -i STATUS
squeue
sinfo
```{{exec}}

Once `squeue`/`sinfo` return cleanly (munge is up), press **Check**.
