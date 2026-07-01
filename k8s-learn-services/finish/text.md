# Services, demystified

`expose` created a Service whose **selector** matches the Deployment's Pod
labels. The **endpoints** list is those matching Pod IPs — if it's ever empty,
the selector doesn't match (the #1 Service bug). In-cluster DNS lets other Pods
reach it by name.
