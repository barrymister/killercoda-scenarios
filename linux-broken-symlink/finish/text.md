# Symlinks resolved

A **dangling symlink** points at a path that doesn't exist — the link is there
(`which`/`ls` find it) but the target is gone, so you get "No such file or
directory". `ls -l` shows `link -> target`; `readlink -f` resolves it. `ln -sf`
repoints it. Same trick fixes `/etc/alternatives` and version-manager shims.
