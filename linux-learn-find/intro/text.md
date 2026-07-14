# Find files, then act on them

`find` walks a directory tree and filters by attribute — name, size, age, type,
permissions. Once you have matches, you either run a command on each with `-exec`,
or pipe the list into `xargs`.

Key patterns:

- `find PATH -name '*.log'` — match by filename
- `find PATH -size +1M` — larger than 1 megabyte
- `find PATH -mtime +7` — modified more than 7 days ago
- `find PATH -type f` — regular files only
- `find ... -exec cmd {} \;` or `find ... | xargs cmd` — act on the matches

A small tree lives under `/root/proj` with a big log, an old log, and a source file
already staged.
