# Mind the subshell

Anything after a `|` runs in a subshell, so variables changed there don't survive
the pipe. Classic fix: redirect the file into the loop — `while read n; do ...;
done < file` — so it runs in the current shell. (Process substitution
`done < <(command)` does the same when the input is a command.)
