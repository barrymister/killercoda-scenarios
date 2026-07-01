# Nice work

When a well-known image exits instantly, the logs usually name the missing
piece. Required env vars (`POSTGRES_PASSWORD`, `MYSQL_ROOT_PASSWORD`, API keys)
are the classic cause — the container's equivalent of a Kubernetes
`CreateContainerConfigError` from a missing ConfigMap/Secret key. Read the log,
pass `-e KEY=value`, re-run.
