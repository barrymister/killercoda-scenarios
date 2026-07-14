# Walk the diagnosis methodology

Work top-down. Start at the node - if the node is unhealthy, nothing else matters.

```
kubectl get nodes
```{{exec}}

The node is Ready, so the problem is with the Pod. Check its state:

```
kubectl get pods
```{{exec}}

The `mystery` Pod is not Running. Describe it and read the Events at the bottom - this is where the real reason shows up:

```
kubectl describe pod mystery
```{{exec}}

Cluster events give the same story sorted by time:

```
kubectl get events --sort-by=.lastTimestamp
```{{exec}}

Try the logs. They may be empty because the container never started:

```
kubectl logs mystery
```{{exec}}

The Events show the image tag cannot be pulled (ImagePullBackOff / ErrImagePull) because `nginx:doesnotexist-999` does not exist. Record the diagnosis you found - write what YOU observed:

```
echo "ImagePullBackOff: image tag does not exist" > /root/answer.txt
```{{exec}}

When `/root/answer.txt` describes the image pull problem, press **Check**.
