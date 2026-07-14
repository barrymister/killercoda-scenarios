# df & du

`df -h` shows free space per mounted filesystem — start here to see *which* disk is
full. `du -h --max-depth=1 DIR | sort -rh` walks a directory and ranks its
subdirectories by size, so you can drill down to *what* filled it. `du -sh DIR`
totals a single directory. And when you need to stop it happening — cap how much
each user can consume — that's the job of disk **quotas** (`quota`, `edquota`).
