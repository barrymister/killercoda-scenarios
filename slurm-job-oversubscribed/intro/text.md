# This job will wait forever

Someone's job `/root/train.sh` is queued but never runs. The node is idle — so
it's not a busy-cluster problem. Something about the *request* is impossible.
Find it, fix the script, and get the job to actually complete.
