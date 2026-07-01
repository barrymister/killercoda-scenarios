# Pods are cattle — Services are the address

Pods come and go, each with its own throwaway IP. A **Service** gives a stable
name + virtual IP that load-balances across the matching Pods. A `web`
Deployment is already running for you — let's put a Service in front of it.
