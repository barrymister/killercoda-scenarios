# sudo restored

sudo reads `/etc/sudoers` **and** every file under `/etc/sudoers.d/` — a single
syntax error in any one of them disables sudo system-wide. `visudo -c` validates
the whole set and names the bad file and line; `visudo` (or `visudo -f <file>`)
prevents you saving a broken file in the first place, which is exactly why you
should always edit sudoers through it. When you must touch these files, keep a
separate root shell open so a mistake can't lock you out.
