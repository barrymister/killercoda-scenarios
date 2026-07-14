# You have a restorable backup

You captured the full cluster state into `/root/etcd-snap.db` and confirmed it with `snapshot status`. We graded that a valid snapshot file was produced - restoring it with `etcdctl snapshot restore` would rebuild the datastore, but that is a disruptive operation left out of this single-node lab.
