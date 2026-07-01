# Commit relocated

The move-a-commit-to-another-branch recipe: `git branch feature` pins the work to
a new branch, then `git reset --hard HEAD~1` rewinds `main` (safe here because the
commit is now reachable from `feature`). `reset --hard` discards the working tree,
so only use it when the commit is saved elsewhere. `git cherry-pick` does the
reverse — copy a commit onto another branch.
