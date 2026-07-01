# Off the detached HEAD

A **detached HEAD** points straight at a commit, not a branch — new commits there
are only reachable by hash and get garbage-collected once you leave. The fix:
`git branch <name>` (or `git switch -c <name>`) to pin the commit to a branch,
then merge it where it belongs. `git reflog` finds it if you already left.
