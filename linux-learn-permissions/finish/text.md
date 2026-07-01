# Permissions, demystified

`ls -l` shows the rwx triplets for owner/group/other. `chmod +x` added the
execute bit so the script could run; `chmod 644` / `755` set them numerically
(r=4, w=2, x=1). `chown` changes the owner. "Permission denied" almost always
means a missing bit or wrong owner.
