# apt & dpkg

`apt-get install`, `remove`, and `purge` manage packages at a high level —
`remove` keeps config files, `purge` deletes them too. Run `apt-get update` first
so the index is current. For inspecting what's installed, `dpkg` is the low-level
tool: `dpkg -l` lists packages, `dpkg -L NAME` shows the files a package owns,
and `dpkg -S PATH` finds which package a file came from. `apt`/`dpkg` are the
Debian/Ubuntu world; on Fedora/RHEL the same jobs are done by `dnf` and `rpm`.
