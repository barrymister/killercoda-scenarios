# Nice work

The pod could not start because its PersistentVolumeClaim `data-pvc` stayed Pending - there was no PersistentVolume matching its storage class, access mode, and size. Creating a matching `manual` hostPath PV let the claim bind, and the pod could then mount its volume and run.

The lesson: a pod stuck in ContainerCreating with a volume is almost always a storage problem. Check the PVC phase first, then confirm a PV exists whose storageClassName, accessModes, and capacity satisfy the claim.
