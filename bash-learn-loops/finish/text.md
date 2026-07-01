# Loops

`for x in a b c; do ... done` walks a list (use `$(seq 1 5)` or `{1..5}` for
ranges, `*.txt` for files). `while CONDITION; do ... done` repeats until the
condition fails. Loops + a test are how scripts process batches of files or
lines.
