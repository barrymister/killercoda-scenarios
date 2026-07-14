# Create config, then inject it into a Pod

Create a ConfigMap holding a non-secret value:

```
kubectl create configmap appcfg --from-literal=COLOR=blue
```{{exec}}

Create a Secret holding a sensitive value:

```
kubectl create secret generic appsec --from-literal=TOKEN=s3cr3t
```{{exec}}

Create a Pod named `cfgpod` that pulls `COLOR` from the ConfigMap key and `TOKEN` from the Secret key using `valueFrom`:

```
cat <<'EOF' | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: cfgpod
spec:
  containers:
  - name: app
    image: busybox:1.36
    command: ["sleep", "3600"]
    env:
    - name: COLOR
      valueFrom:
        configMapKeyRef:
          name: appcfg
          key: COLOR
    - name: TOKEN
      valueFrom:
        secretKeyRef:
          name: appsec
          key: TOKEN
EOF
```{{exec}}

Wait for the Pod to be ready:

```
kubectl wait --for=condition=Ready pod/cfgpod --timeout=90s
```{{exec}}

Confirm both variables are present inside the container:

```
kubectl exec cfgpod -- printenv COLOR TOKEN
```{{exec}}

When `printenv` shows `blue` and `s3cr3t`, press **Check**.
