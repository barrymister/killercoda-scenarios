# Snapshot etcd, then verify it

Make sure the `etcdctl` client is available (this is a no-op if it is already installed):

```
apt-get install -y etcd-client >/dev/null 2>&1 || true
```{{exec}}

Take the snapshot, authenticating with the etcd client certs:

```
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key snapshot save /root/etcd-snap.db
```{{exec}}

Confirm the snapshot is valid and readable:

```
ETCDCTL_API=3 etcdctl --write-out=table snapshot status /root/etcd-snap.db
```{{exec}}

That prints a table with a hash, revision, and key count. When the snapshot file exists and its status prints, press **Check**.
