# Resolve a Service by DNS name

Every Service gets an in-cluster DNS name of the form `<service>.<namespace>.svc.cluster.local`, served by CoreDNS. Pods use this name to reach each other instead of hard-coding IP addresses.

First create a deployment to back the Service:

```
kubectl create deployment web --image=nginx:1.27
```{{exec}}

Now expose it as a Service on port 80. This is what registers the DNS name:

```
kubectl expose deployment web --port=80
```{{exec}}

Run a throwaway pod to look up the Service by name. Using `web.default` resolves the `web` Service in the `default` namespace:

```
kubectl run dnstest --image=busybox:1.36 --restart=Never --rm -i --command -- nslookup web.default
```{{exec}}

You should see the Service's cluster IP in the output. The fully qualified form is `web.default.svc.cluster.local` - the short name works because pods search the local namespace by default.

When the `web` Service has endpoints and resolves by name, press **Check**.
