# Create a static Pod

Write a Pod manifest directly into the kubelet's static-pod directory. The kubelet picks up the file within a few seconds and starts the container.

```
cat <<'EOF' > /etc/kubernetes/manifests/staticweb.yaml
apiVersion: v1
kind: Pod
metadata:
  name: staticweb
  namespace: default
spec:
  containers:
  - name: web
    image: nginx:1.27
    ports:
    - containerPort: 80
EOF
```{{exec}}

Give the kubelet a moment to notice the file and start the Pod:

```
sleep 20
```{{exec}}

Now look for the mirror Pod in the API. Its name will have the node name appended (for example staticweb-controlplane):

```
kubectl get pods -A | grep staticweb
```{{exec}}

When a staticweb Pod appears in the list, press **Check**.
