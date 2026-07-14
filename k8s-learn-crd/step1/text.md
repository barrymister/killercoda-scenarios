# Apply a CRD and create a custom resource

Define a new kind called Widget in the group stable.example.com. The names block sets the plural, singular, and kind that kubectl will use.

```
cat <<'EOF' > /root/widget-crd.yaml
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: widgets.stable.example.com
spec:
  group: stable.example.com
  scope: Namespaced
  names:
    plural: widgets
    singular: widget
    kind: Widget
  versions:
  - name: v1
    served: true
    storage: true
    schema:
      openAPIV3Schema:
        type: object
        properties:
          spec:
            type: object
            properties:
              size:
                type: string
EOF
kubectl apply -f /root/widget-crd.yaml
```{{exec}}

Wait for the API server to register the new type:

```
kubectl wait --for condition=Established crd/widgets.stable.example.com --timeout=60s
```{{exec}}

Now create a Widget custom resource named demo:

```
cat <<'EOF' > /root/widget-demo.yaml
apiVersion: stable.example.com/v1
kind: Widget
metadata:
  name: demo
spec:
  size: large
EOF
kubectl apply -f /root/widget-demo.yaml
```{{exec}}

Confirm both the CRD and your custom resource exist:

```
kubectl get crd widgets.stable.example.com
kubectl get widgets
```{{exec}}

When the CRD is Established and the demo Widget is listed, press **Check**.
