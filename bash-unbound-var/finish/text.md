# Strict mode catches typos

`set -u` (part of `set -euo pipefail`) turns referencing an unset variable into a
loud, immediate error instead of a silent empty string — so a typo like
`$TARGE_DIR` fails fast instead of quietly corrupting a path. The fix is to
correct the name. When a variable is *legitimately* optional, spell that out with
a default: `${VAR:-fallback}` expands to `fallback` when `VAR` is unset.
