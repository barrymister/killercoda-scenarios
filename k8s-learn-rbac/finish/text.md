# RBAC in one breath

You proved the default denial, then a **Role** (what is allowed) plus a **RoleBinding** (who gets it) turned that `no` into a `yes` for the `reader` ServiceAccount. This is the exact pattern for scoping least-privilege access to any workload in a namespace.
