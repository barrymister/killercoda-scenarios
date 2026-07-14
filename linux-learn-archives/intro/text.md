# Bundle files with tar

`tar` packs many files into one **archive**, optionally compressed with gzip. It's
the standard way to back up a directory or move a tree between machines.

The flags read like a sentence:

- `c` = **create**, `x` = e**x**tract, `t` = lis**t** contents
- `z` = gzip compression, `f` = the archive **f**ilename, `v` = verbose
- `-C DIR` = change to DIR first (controls what paths go in / where they come out)

So `tar czf out.tar.gz -C /root data` means *create a gzipped file `out.tar.gz` from
`data`, working relative to `/root`*. A `/root/data` folder with two files is already
staged.
