# Secret contained

`git rm --cached <file>` stops tracking a file without deleting it; a
`.gitignore` entry keeps it from being staged again. If a secret was already
committed, unstaging isn't enough — rotate the key and scrub history
(`git filter-repo` / BFG), because it lives in past commits.
