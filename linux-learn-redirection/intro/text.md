# Redirection, pipes, and here-docs

Every command has two output streams: **stdout** (file descriptor 1, normal output)
and **stderr** (fd 2, errors). Redirection lets you send each wherever you want — to
a file, to another command, or merged together.

Key operators:

- `>file` — send stdout to a file (**truncates** it); `>>file` **appends**
- `2>file` — send stderr to a file
- `2>&1` — merge stderr into wherever stdout currently goes
- `cmd | tee file` — write output to a file **and** still print it
- `<<'EOF' ... EOF` — a here-doc feeds a block of text as stdin

No pre-staging needed — you'll generate the streams yourself.
