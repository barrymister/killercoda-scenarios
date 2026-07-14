# Diagnose and fix the NetworkPolicy

## 1. Confirm the app is running

The pod itself is healthy - this is not a crash:

```
kubectl get pods -l app=web
```{{exec}}

## 2. Find the offending policy

List the NetworkPolicies in the namespace:

```
kubectl get netpol
```{{exec}}

You will see `default-deny`. Inspect what it does:

```
kubectl describe netpol default-deny
```{{exec}}

Its pod selector is empty (`{}`), which means it applies to every pod in the namespace, and it has `policyTypes: Ingress` with no ingress rules. In NetworkPolicy terms, that is deny-all-ingress: no traffic is allowed in.

## 3. Fix

The simplest correct fix here is to remove the overly broad policy so normal traffic is allowed again:

```
kubectl delete netpol default-deny
```{{exec}}

(In production you would instead add a targeted allow rule, but for this app the deny-all was the mistake.)

## 4. Verify

Confirm the policy is gone:

```
kubectl get netpol
```{{exec}}

When `default-deny` no longer appears, press **Check**.
