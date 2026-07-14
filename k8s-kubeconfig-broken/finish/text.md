# Nice work

The kubeconfig's server URL had been changed to a dead port, so kubectl could not reach the API server even though the cluster was fine. Restoring `/root/.kube/config` from the kubeadm admin config at `/etc/kubernetes/admin.conf` fixed it instantly.

The lesson: when kubectl fails everywhere at once, suspect the client config before the cluster. Keep a known-good copy (or the admin.conf) around so recovery is a one-line restore.
