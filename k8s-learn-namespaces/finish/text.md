# Namespaces in practice

Resources live *inside* a namespace — `kubectl` defaults to `default`, so you
pass `-n <name>` (or set a default with `kubectl config set-context`). Names only
need to be unique within a namespace, so `dev/web` and `prod/web` can coexist.
