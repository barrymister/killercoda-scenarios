# Build and enable a swap file

Allocate a 128 MB file. `fallocate` is instant; if it's unsupported on this
filesystem, the `dd` fallback fills the file with zeros:

```
fallocate -l 128M /swapfile || dd if=/dev/zero of=/swapfile bs=1M count=128
```{{exec}}

Lock the permissions, then write the swap signature. The kernel **refuses** a
swap file that others can read, so `chmod 600` is mandatory, not optional:

```
chmod 600 /swapfile
mkswap /swapfile
```{{exec}}

Turn it on and confirm the kernel is using it:

```
swapon /swapfile
swapon --show
free -h
```{{exec}}

To make swap survive a reboot you'd add this line to `/etc/fstab` (shown for
reference — you don't need to for this lab):

```
/swapfile none swap sw 0 0
```

When `swapon --show` lists `/swapfile`, press **Check**.
