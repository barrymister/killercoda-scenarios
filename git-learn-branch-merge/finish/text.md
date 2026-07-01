# Branching, merged

`git switch -c feature` created and moved to a branch; commits there don't touch
`main` until you `git merge`. When the branches haven't diverged, Git
fast-forwards; otherwise it makes a merge commit. Branches are cheap — make one
per feature or fix.
