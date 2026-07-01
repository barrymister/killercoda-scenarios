# Functions

`name() { ...; }` defines a function; call it as `name arg1 arg2`. Inside, `$1`
is the first argument, `$@` is all of them, and `return N` sets its exit code.
Functions keep scripts DRY and readable — the same move as any other language.
