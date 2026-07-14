# The cleanup script is dangerous

`/root/clean.sh` is meant to delete only the `*.tmp` files in `/root/work` and
leave everything else alone. But it's written carelessly — it stores a glob in an
unquoted variable, so it misfires on filenames with spaces and can target the
wrong things.

Rewrite the script so it safely removes **only** the `.tmp` files, then run it.
The two real files — `keep me.txt` (note the space) and `important.txt` — must
survive.
