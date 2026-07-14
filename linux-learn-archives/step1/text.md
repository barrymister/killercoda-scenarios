# Pack it, peek inside, restore it

Create a gzipped tarball of the `data` folder. `-C /root` makes the paths inside the
archive relative (`data/a.txt`, not `/root/data/a.txt`):

```
tar czf /root/data.tar.gz -C /root data
```{{exec}}

List the contents **without** extracting — `t` for list, no files touched on disk:

```
tar tzf /root/data.tar.gz
```{{exec}}

Now extract into a fresh directory. `-C /root/restore` sends the output there
instead of the current directory:

```
mkdir -p /root/restore
tar xzf /root/data.tar.gz -C /root/restore
ls /root/restore/data
```{{exec}}

When `/root/data.tar.gz` exists and `/root/restore/data/a.txt` was restored, press
**Check**.
