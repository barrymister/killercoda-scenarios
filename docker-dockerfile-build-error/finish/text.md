# Nice work

`docker build` fails loudly and points at the exact line — the fix is almost
always in the error text (a typo'd instruction, a `COPY` of a file that isn't in
the build context, a bad base image). Read the failing line, edit the
Dockerfile, rebuild. Build errors are the one break-fix class you catch *before*
anything ever runs.
