# Install with apt, query with dpkg

Refresh the package index so apt knows what's available (`-qq` keeps it quiet):

```
apt-get update -qq
```{{exec}}

Install the `tree` utility. `-y` answers "yes" to the prompt:

```
apt-get install -y tree
```{{exec}}

Now query the installed package with `dpkg`. Its status:

```
dpkg -s tree
```{{exec}}

Every file it put on disk:

```
dpkg -L tree
```{{exec}}

And the reverse — which package owns the `tree` binary:

```
dpkg -S "$(command -v tree)"
```{{exec}}

To uninstall later, `apt-get remove tree` drops the program but keeps its config
files; `apt-get purge tree` removes the config too.

When `tree` is installed (`dpkg -s tree` shows `Status: install ok installed`),
press **Check**.
