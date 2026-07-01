# `cp: cannot stat '/app.txt'`

`/root/copy.sh` should copy `src/app.txt` into `dest/`, but it fails trying to
read `/app.txt` — note the missing directory. A variable name is misspelled.
