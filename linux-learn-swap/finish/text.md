# Swap space

Swap is disk used as overflow when RAM fills up. The recipe for a swap file is
always the same: allocate it (`fallocate` or `dd`), lock it with `chmod 600`,
stamp it with `mkswap`, then activate it with `swapon`. Check what's active with
`swapon --show` and `free -h`. Adding `/swapfile none swap sw 0 0` to
`/etc/fstab` makes it come back after a reboot, and `swapoff /swapfile` turns it
off again.
