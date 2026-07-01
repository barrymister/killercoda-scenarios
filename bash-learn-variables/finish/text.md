# Variables & quoting

`VAR=value` (no spaces) assigns; `$VAR` or `${VAR}` expands. Always wrap
expansions in double quotes (`"$VAR"`) so spaces and special characters survive.
`$(command)` captures output. These three habits prevent most shell bugs.
