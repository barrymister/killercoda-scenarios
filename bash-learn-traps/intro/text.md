# Scripts that fail loudly and clean up

Plain scripts limp on after errors and leave temp files behind. `set -euo
pipefail` makes a script stop the moment something goes wrong, and `trap` runs a
cleanup function however the script exits. You'll write a small script that uses
both and returns an explicit exit code.
