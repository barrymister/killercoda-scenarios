# killercoda-scenarios

Hands-on scenarios for [The Dev Bench](https://thedevbench.com) labs. Each folder
is a [Killercoda](https://killercoda.com/creators) creator scenario: it spins up
a real environment and auto-grades you with a `verify` script (the **Check**
button). Tracks: a **Kubernetes** lab (single-node `kubeadm` cluster), a
**Docker** lab, and core-skill labs — **Linux**, **Bash**, **Git** — all on the
`ubuntu` backend (Docker + Podman + git preinstalled). Every track has two
**modes**:

- **Break-fix** (`*-<fault>` folders): a fault is injected; diagnose and fix it.
- **Learn** (`*-learn-*` folders): a guided getting-started walkthrough, no
  fault — you run the commands, watch them work, and Check confirms the concept.

The break-fix reflex these drill: *site down → look → read the events/logs →
inspect → fix → verify*, narrated out loud, under a clock. Learn mode is the
on-ramp: same real environment, one concept at a time.

## Kubernetes scenarios

Reflex: `get` → `describe`/Events → `logs` → `endpoints` → fix → verify.

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

## Docker scenarios

Reflex: `docker ps`/`ps -a` → `logs` → `inspect`/`port` → `exec` → fix → verify.
Backend: `ubuntu` (Docker + Podman preinstalled).

| # | Folder | Fault | Symptom |
|---|--------|-------|---------|
| 1 | `docker-bad-image-tag` | image tag doesn't exist | `manifest unknown`, nothing runs |
| 2 | `docker-bad-cmd-exits` | container command exits non-zero | `Exited (1)`, empty logs |
| 3 | `docker-port-mapping-wrong` | `-p` maps to a port nothing serves | connection refused on host port |
| 4 | `docker-missing-env-var` | required env var unset | container exits, logs name the var |
| 5 | `docker-volume-wrong-path` | bind mount targets the wrong dir | app ignores your files |
| 6 | `docker-healthcheck-failing` | HEALTHCHECK probes wrong port | `(unhealthy)` forever |
| 7 | `docker-network-dns` | containers on the default bridge | can't resolve each other by name |
| 8 | `docker-dockerfile-build-error` | invalid Dockerfile instruction | `docker build` fails |

## Learn scenarios (getting started)

Guided walkthroughs — no fault injected. Each teaches one concept and the Check
confirms you did it. Same backends as the break-fix tracks.

### Kubernetes — Learn (`kubernetes-kubeadm-1node`)

| # | Folder | Teaches |
|---|--------|---------|
| 1 | `k8s-learn-pods` | run/inspect/log/exec a Pod |
| 2 | `k8s-learn-deployments` | Deployments, scaling, rollout |
| 3 | `k8s-learn-services` | expose a Deployment, endpoints, in-cluster DNS |
| 4 | `k8s-learn-config` | ConfigMaps as env vars |
| 5 | `k8s-learn-namespaces` | namespaces + `-n` scoping |

### Docker — Learn (`ubuntu`)

| # | Folder | Teaches |
|---|--------|---------|
| 1 | `docker-learn-run` | run/ps/logs/exec/rm a container |
| 2 | `docker-learn-images` | pull + tag images |
| 3 | `docker-learn-ports` | publish a port (`-p host:container`) |
| 4 | `docker-learn-volumes` | persist data with named volumes |
| 5 | `docker-learn-env` | configure via `-e` env vars |

## Core-skill labs (Linux, Bash, Git)

All on the `ubuntu` backend. Each has a Learn track (guided, no fault) and a
Break-fix track (a fault to diagnose and fix). Verify scripts are deterministic
(filesystem / process / git state), so they grade without network flakiness.

### Linux

| Mode | Folders |
|------|---------|
| Learn | `linux-learn-files`, `linux-learn-permissions`, `linux-learn-processes`, `linux-learn-text` |
| Break-fix | `linux-disk-space-hog`, `linux-permission-denied`, `linux-broken-symlink`, `linux-runaway-process` |

### Bash

| Mode | Folders |
|------|---------|
| Learn | `bash-learn-variables`, `bash-learn-conditionals`, `bash-learn-loops`, `bash-learn-functions` |
| Break-fix | `bash-test-brackets`, `bash-crlf-endings`, `bash-var-typo`, `bash-pipe-subshell` |

### Git

| Mode | Folders |
|------|---------|
| Learn | `git-learn-init-commit`, `git-learn-branch-merge`, `git-learn-undo`, `git-learn-history` |
| Break-fix | `git-unstage-secret`, `git-detached-head`, `git-merge-conflict`, `git-wrong-branch` |

## Layout per scenario

```
<scenario>/
  index.json         # title, steps, backend imageid (kubernetes-kubeadm-1node | ubuntu)
  intro/text.md      # the brief: "the site is down"
  intro/background.sh# waits for the cluster/daemon, then INJECTS the fault (hidden)
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
