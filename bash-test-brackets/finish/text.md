# Brackets need breathing room

`[ ... ]` is the `test` command in disguise, so it needs a space after `[`,
before `]`, and around every operator: `[ "$x" -gt 3 ]`. Missing spaces give
`[5: command not found` or wrong results. `[[ ... ]]` (bash) is safer for strings
and lets you skip some quoting.
