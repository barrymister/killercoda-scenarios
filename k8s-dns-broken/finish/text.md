# Nice work

CoreDNS had been scaled to zero replicas, so no pods were left to answer DNS queries and every name lookup inside the cluster failed. Scaling the Deployment back to two replicas restored in-cluster DNS.

The lesson: when Services resolve by IP but not by name, look at CoreDNS in `kube-system` first - check its Deployment replica count and pod health before touching anything else.
