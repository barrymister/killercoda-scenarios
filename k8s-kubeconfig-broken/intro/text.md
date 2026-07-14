# kubectl stopped working

You sit down to check on the cluster and nothing works. Every command - even a simple `kubectl get nodes` - hangs and then fails with a connection error, as if the API server had vanished.

The cluster itself is healthy. Something is wrong with your local kubeconfig, the file that tells kubectl where the cluster lives and who you are. Your job is to find the bad setting and restore a working config.
