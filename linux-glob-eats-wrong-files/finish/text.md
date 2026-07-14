# Cleanup made safe

Globbing bugs bite when a pattern is kept in an unquoted variable and filenames
contain spaces — word-splitting hands `rm` the wrong arguments, and an empty
match can leak a literal `*.tmp` through. The safe idiom: loop over the glob with
quoted expansions (`for f in "$DIR"/*.tmp; do rm -- "$f"; done`), pass `--` so a
name starting with `-` can't be read as an option, and set `shopt -s nullglob`
so no-match expands to nothing. Test destructive scripts with `echo` in front of
`rm` before you let them delete for real.
