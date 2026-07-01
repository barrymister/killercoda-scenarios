# Make decisions with `if`

`if` runs a **test** and branches on its exit code (0 = success). `[ ... ]` is
the test command — mind the spaces. Every command sets `$?`, the exit code of
the last thing that ran.
