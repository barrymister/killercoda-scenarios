# Build the PV → VG → LV stack

First see the loop devices standing in for disks — you'll use these two device
paths (typically `/dev/loop0` and `/dev/loop1`) below:

```
losetup -a
```{{exec}}

Mark both as **physical volumes**, then pool them into a **volume group** named
`benchvg`:

```
pvcreate /dev/loop0 /dev/loop1
vgcreate benchvg /dev/loop0 /dev/loop1
```{{exec}}

Carve a 200 MB **logical volume** named `data` out of the pool and put an ext4
filesystem on it:

```
lvcreate -L 200M -n data benchvg
mkfs.ext4 /dev/benchvg/data
```{{exec}}

Inspect each layer:

```
pvs
vgs
lvs
```{{exec}}

The payoff comes later: `lvextend -L +100M -r /dev/benchvg/data` grows the volume
**and** its filesystem in a single command — no unmount, no repartition. That's
the LVM superpower.

When `lvs` shows the `data` volume in `benchvg`, press **Check**.
