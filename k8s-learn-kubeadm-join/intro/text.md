# Joining a worker to the cluster

A new worker node joins a kubeadm cluster by presenting a **bootstrap token** and the control-plane's **CA cert hash** so both sides can trust each other. The command `kubeadm token create --print-join-command` prints the exact `kubeadm join` line to run on the new machine. You will generate and save that real join command here.
