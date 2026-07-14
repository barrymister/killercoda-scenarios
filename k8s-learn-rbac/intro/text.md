# RBAC grants permissions to identities

Kubernetes denies every request by default. **RBAC** opens specific doors: a **Role** lists allowed verbs on resources in a namespace, a **RoleBinding** grants that Role to a subject, and a **ServiceAccount** is the identity a workload uses. You will grant a ServiceAccount permission to list pods and watch the denial turn into a yes.
