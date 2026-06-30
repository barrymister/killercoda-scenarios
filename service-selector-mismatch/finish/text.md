# Nice work

When pods are healthy but traffic dies, check `kubectl get endpoints <svc>`. An
empty endpoints list almost always means the Service `selector` doesn't match
the pod labels. This one doesn't show up in `get pods` — you have to look for it.
