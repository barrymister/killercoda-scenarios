# Typos expand to nothing

By default an unset variable silently expands to an empty string, so `$SOURC_DIR`
became `""` and the path collapsed to `/app.txt`. Two defenses: `set -u` (or
`set -euo pipefail`) makes the script *fail loudly* on an unset variable, and
`"${VAR:?message}"` errors with your message. Catch typos early.
