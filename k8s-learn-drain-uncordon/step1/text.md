# Run a node maintenance cycle

First list the nodes and note the name. On this single-node cluster there is just one node - the control-plane node. Substitute its name wherever you see NODE below.

```
kubectl get nodes
```{{exec}}

Capture the node name into a variable so the next commands are easy:

```
NODE=$(kubectl get nodes -o jsonpath='{.items[0].metadata.name}')
echo "$NODE"
```{{exec}}

Cordon and drain the node. Draining evicts the workloads on the node; DaemonSet pods and the control-plane static pods are ignored, and emptyDir data is discarded. The `--force` flag lets it evict pods that are not managed by a controller.

```
kubectl drain "$NODE" --ignore-daemonsets --delete-emptydir-data --force
```{{exec}}

Notice the node is now marked unschedulable. Once maintenance would be finished, return the node to service with uncordon:

```
kubectl uncordon "$NODE"
```{{exec}}

Confirm the node is schedulable again (no SchedulingDisabled in the STATUS column):

```
kubectl get nodes
```{{exec}}

When the node shows Ready with no SchedulingDisabled, press **Check**.
