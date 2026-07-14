# Robust scripts

`set -euo pipefail` is the safety harness — die on errors (`-e`), on unset
variables (`-u`), and on any failed pipeline stage (`pipefail`). `trap cleanup
EXIT` guarantees your cleanup runs however the script ends, so temp files and
locks never leak. `$?` holds the last exit code (`0` = success, non-zero =
failure). These four habits prevent most silent-failure bugs.
