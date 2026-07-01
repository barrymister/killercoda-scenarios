# `bad interpreter: /bin/bash^M`

`/root/build.sh` was edited on Windows and won't run — the shebang line has an
invisible carriage return. Make it a proper Unix script so it runs.
