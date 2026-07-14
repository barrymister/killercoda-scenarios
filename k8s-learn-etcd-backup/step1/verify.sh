#!/bin/bash
[ -f /root/etcd-snap.db ] || exit 1
ETCDCTL_API=3 etcdctl --write-out=table snapshot status /root/etcd-snap.db >/dev/null 2>&1
