# killercoda-scenarios

Hands-on **Kubernetes break-fix** scenarios for [The Dev Bench](https://thedevbench.com)
K8s lab. Each folder is a [Killercoda](https://killercoda.com/creators) creator
scenario: it spins up a real single-node `kubeadm` cluster, quietly injects one
fault, and auto-grades your fix with a `verify` script (the **Check** button).

The reflex these drill: *site down → `get` → `describe`/Events → `logs` →
`endpoints` → fix → verify*, narrated out loud, under a clock.

## Scenarios

| # | Folder | Fault | Symptom |
|---|--------|-------|---------|
| 1 | `imagepullbackoff-bad-tag` | bad image tag | `ImagePullBackOff` |
| 2 | `crashloopbackoff-bad-command` | command exits non-zero | `CrashLoopBackOff` |
| 3 | `oomkilled-low-memory-limit` | memory limit too low | `OOMKilled` |
| 4 | `service-selector-mismatch` | Service selector ≠ pod labels | no endpoints |
| 5 | `readiness-probe-wrong-port` | probe on wrong port | never Ready |
| 6 | `configmap-missing-key` | env refs missing ConfigMap key | `CreateContainerConfigError` |
| 7 | `rbac-forbidden-list-pods` | ServiceAccount lacks a verb | `forbidden` |
| 8 | `node-taint-pod-pending` | node tainted, pod has no toleration | `Pending` |

## Layout per scenario

```
<scenario>/
  index.json         # title, steps, backend imageid (kubernetes-kubeadm-1node)
  intro/text.md      # the brief: "the site is down"
  intro/background.sh# waits for the cluster, then INJECTS the fault (hidden)
  step1/text.md      # the task
  step1/verify.sh    # auto-grades the fix (exit 0 = pass)
  finish/text.md     # what you just practised
```

## Connecting to Killercoda

1. Sign in at killercoda.com with GitHub.
2. Creators → connect this repo.
3. Scenarios appear at `https://killercoda.com/<your-handle>/scenario/<folder>`.
4. Set `NEXT_PUBLIC_KILLERCODA_CREATOR=<your-handle>` in The Dev Bench's Netlify
   env to light up the embedded terminals. No reseed needed.

> Faults not embedded here (need a private registry / ingress+TLS): **missing
> registry secret** and **expired TLS cert** — drill those on the local `kind`
> lane (see growth-engine `docs/career/K8S_BREAKFIX_LAB.md`).
