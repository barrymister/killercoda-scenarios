# Conflict resolved

A conflict happens when two branches change the same lines. Git pauses the merge
and writes both versions between `<<<<<<<`/`=======`/`>>>>>>>` markers. You edit
the file to the version you want, `git add` it to mark it resolved, and
`git commit` to finish. `git merge --abort` backs all the way out if you'd rather.
