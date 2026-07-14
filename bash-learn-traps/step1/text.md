# Strict mode + a cleanup trap

Put it in a script:

```
cat > /root/safe.sh <<'SH'
#!/bin/bash
set -euo pipefail                      # exit on error, unset var, failed pipe
tmp=$(mktemp)
cleanup() { rm -f "$tmp"; echo "cleaned up"; }
trap cleanup EXIT                      # always run on exit
echo "working in $tmp"
echo "done" > "$tmp"
exit 0
SH
bash /root/safe.sh
echo "exit code was $?"
```{{exec}}

What each part does:

- `set -e` — exit immediately if any command fails (non-zero exit).
- `set -u` — treat referencing an **unset** variable as an error, not empty text.
- `set -o pipefail` — a pipeline fails if **any** stage fails, not just the last.
- `trap cleanup EXIT` — run `cleanup` on **any** exit: success, error, or signal.
  Use `trap cleanup INT TERM` to also catch Ctrl-C and kill signals.
- `$?` — the last command's exit code (`0` = success, non-zero = failure).

You'll see `working in ...`, then `cleaned up` from the trap, then `exit code
was 0`. The trap fired even though the script exited normally. Press **Check**.
