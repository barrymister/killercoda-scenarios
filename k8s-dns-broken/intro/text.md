# In-cluster DNS is down

Apps across the cluster suddenly cannot talk to each other by name. Pods report errors like "could not resolve host" whenever they try to reach a Service such as `my-svc.default.svc.cluster.local`.

IP addresses still work, but names do not - a classic sign that cluster DNS has stopped. CoreDNS runs in `kube-system` and answers those lookups. Find out why it is not responding and bring it back.
