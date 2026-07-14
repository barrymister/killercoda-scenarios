# "Disk full" — now find what's eating it

Two tools answer the two halves of that question:

- `df` — how much free space each **filesystem** has (the big picture)
- `du` — how much space each **directory** uses (drill down to the culprit)

The classic workflow: `df -h` tells you *which* filesystem is full, then `du`
walks down the tree to find *what* filled it.

A directory on this box is quietly hogging space. Your job is to hunt it down
with `du`, identify the biggest consumer under `/var`, and record your answer.

- `df -h` — free space per filesystem, human-readable
- `du -h --max-depth=1 DIR | sort -rh` — biggest subdirectories, largest first
- `du -sh DIR` — one directory's total
