# Branching, exit codes

`if COMMAND; then ... fi` branches on the command's exit code. `[ -f x ]` tests a
file, `[ "$a" = "$b" ]` compares strings, `[ "$n" -gt 3 ]` compares numbers —
always with spaces inside the brackets. `$?` holds the last exit code; 0 is
success, non-zero is failure.
