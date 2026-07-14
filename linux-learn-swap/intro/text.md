# Swap is overflow RAM on disk

When physical memory fills up, Linux moves idle pages to **swap** — disk space
that stands in for RAM. It's slower than real memory, but it keeps the system
from killing processes when things get tight.

Swap can live on a dedicated partition or, more flexibly, in an ordinary **swap
file**. In this lab you'll build a swap file from scratch:

- `fallocate` / `dd` — allocate the file
- `chmod 600` — lock it down (the kernel refuses a world-readable swap file)
- `mkswap` — write the swap signature onto it
- `swapon` — tell the kernel to start using it

You'll finish by confirming it's live with `swapon --show` and `free -h`.
