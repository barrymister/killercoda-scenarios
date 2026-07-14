# A pod that never starts

You deployed a pod called `app` that needs persistent storage, but it is stuck and never becomes Ready - it sits in Pending / ContainerCreating forever.

The pod mounts a PersistentVolumeClaim named `data-pvc`, and that claim is stuck in Pending because there is no PersistentVolume for it to bind to. Provision matching storage so the claim binds and the pod can start.
