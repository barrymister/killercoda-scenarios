# Nice work

A `Pending` pod is a scheduling problem — `describe pod` Events name the reason:
untolerated taints, insufficient CPU/memory requests, or node selectors that
match nothing. Here, a toleration lets the pod land on the tainted node (removing
the taint also works).
