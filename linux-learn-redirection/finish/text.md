# Redirection, pipes, here-docs

stdout is file descriptor 1, stderr is fd 2. `>file` redirects stdout and
**truncates** the target (`>>` appends instead); `2>file` redirects stderr; `2>&1`
merges stderr into wherever stdout is currently going — and the **order** matters,
so put the file redirect first. `tee` writes to a file while still passing output
downstream. A here-doc (`<<'EOF' ... EOF`) feeds a literal block as stdin, which
makes it the clean way to write config files from a script.
