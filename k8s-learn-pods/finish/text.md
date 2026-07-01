# That's a Pod

`kubectl run` created it, `get`/`describe` showed its state and Events, `logs`
read its output, and `exec` ran a command inside. Real workloads use Deployments
(next) to manage Pods for you — but everything still runs *in* a Pod.
