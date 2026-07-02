# You sized a job

`-c` requests CPUs per task, `--mem` requests memory, `-p` picks a partition.
On a GPU cluster you'd add `--gres=gpu:1`. Right-sizing requests is the core of
keeping expensive GPUs busy instead of idle or over-subscribed.
