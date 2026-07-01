# Container filesystems are throwaway

Delete a container and anything written inside it is gone. A **volume** is
Docker-managed storage you mount into a container so data outlives it. You'll
write a file to a volume and prove it persists.
