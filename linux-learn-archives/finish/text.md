# tar & compression

The `tar` flags are a mnemonic: **c**reate / e**x**tract / lis**t**, plus **z** for
gzip, **f** for the filename, and **v** for verbose. `-C DIR` changes the working
directory so archive paths stay relative and extraction lands where you want. The
copy-a-tree idiom is `tar czf x.tar.gz -C src .` to pack, then `tar xzf x.tar.gz -C
dest` to unpack. Use `t` (`tar tzf`) to inspect an archive before extracting it.
