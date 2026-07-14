# `TARGE_DIR: unbound variable`

`/root/deploy.sh` dies immediately with an `unbound variable` error. It uses
`set -euo pipefail`, and the `-u` flag makes referencing an unset variable a hard
error. A variable name is misspelled — that's strict mode catching a typo for
you, not a bug in strict mode.
