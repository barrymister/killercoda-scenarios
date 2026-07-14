# Set CPU requests, then create an HPA

Create a Deployment to autoscale:

```
kubectl create deployment web --image=nginx
```{{exec}}

An HPA compares live CPU usage to each Pod's CPU request, so the request must exist. Set one:

```
kubectl set resources deployment web --requests=cpu=100m
```{{exec}}

Create the HorizontalPodAutoscaler. It targets 50 percent of the CPU request and may scale `web` between 1 and 5 replicas:

```
kubectl autoscale deployment web --cpu-percent=50 --min=1 --max=5
```{{exec}}

Confirm the HPA object exists and shows its max target:

```
kubectl get hpa web
```{{exec}}

Note: this single-node cluster has no metrics-server and no real load, so the HPA will not actually change the replica count here; the `TARGETS` column may read `<unknown>`. That is expected. We are grading that the HPA is correctly authored with a max target.

When `kubectl get hpa web` lists the `web` autoscaler, press **Check**.
