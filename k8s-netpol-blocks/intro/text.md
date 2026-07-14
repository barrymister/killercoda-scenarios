# Traffic to the web app is being blocked

A teammate added some "security hardening" to the `default` namespace, and now the `web` app is unreachable - nothing can connect to it anymore, even though the pod is running fine.

The change was a NetworkPolicy. A too-broad deny-all rule is cutting off all ingress traffic to your pods. Find the offending policy and relax it so the app is reachable again.
