# find & xargs

`find PATH` filters a tree by attribute — `-name`, `-size`, `-mtime`, `-type`,
`-perm` — and combined filters must all match. Act on the results with `-exec cmd {}
\;` (runs the command once per match) or pipe the list into `xargs`. When filenames
can contain spaces, use `find -print0 | xargs -0` so the stream is split on NUL
bytes instead of whitespace.
