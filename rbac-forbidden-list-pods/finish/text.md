# Nice work

`forbidden` errors are RBAC. Read the message — it names the **verb**, the
**resource**, and the **user/ServiceAccount**. Grant exactly that with a Role +
RoleBinding (namespaced) or ClusterRole + ClusterRoleBinding (cluster-wide).
`kubectl auth can-i ... --as=...` is how you confirm it.
