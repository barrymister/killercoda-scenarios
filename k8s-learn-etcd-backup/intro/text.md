# etcd holds all your cluster state

Every object in Kubernetes - Pods, Secrets, ConfigMaps, RBAC - lives in **etcd**, so an etcd snapshot IS your cluster backup. You authenticate to etcd using the API server's client certificates under `/etc/kubernetes/pki/etcd/`. You will take a real snapshot and confirm it is valid.
