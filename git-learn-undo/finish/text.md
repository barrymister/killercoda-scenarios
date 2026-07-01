# Undo, safely

`git restore <file>` discards uncommitted changes in the working tree;
`git restore --staged <file>` unstages without losing the edit. To undo a whole
commit you'd use `git revert` (safe, makes a new commit) or `git reset` (rewrites
history — careful). Committed often = easy to roll back.
