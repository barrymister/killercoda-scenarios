# Print and save the join command

Generate a fresh bootstrap token and print the full join command, saving it to a file:

```
kubeadm token create --print-join-command | tee /root/join.sh
```{{exec}}

The output is a complete `kubeadm join` line - the API server address, a `--token`, and a `--discovery-token-ca-cert-hash`. On a real second machine you would paste this exact command (usually with `sudo`) to enroll it as a worker.

Inspect what you saved:

```
cat /root/join.sh
```{{exec}}

When `/root/join.sh` contains a `kubeadm join` command, press **Check**.
