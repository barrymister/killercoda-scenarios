# You minted a real join token

`kubeadm token create --print-join-command` produced a genuine, usable join command backed by the cluster CA. This backend has only one node, so we graded that you generated and saved the real command - actually running it belongs on a second machine, where you would paste it (with sudo) to enroll the new worker.
