# LVM: flexible storage in layers

Fixed partitions are rigid — resizing them is painful. The **Logical Volume
Manager** solves that by stacking three layers:

- **PV** (physical volume) — a real block device handed to LVM (`pvcreate`)
- **VG** (volume group) — a pool made from one or more PVs (`vgcreate`)
- **LV** (logical volume) — a slice carved out of the pool, which you format and
  mount like a partition (`lvcreate`)

Because the VG is a pool, you can grow an LV later — even while it's mounted. That
live resize is the whole reason LVM exists.

Two 256 MB **loop devices** are already set up to stand in for real disks, so you
can practice the full PV → VG → LV stack safely. Inspect them with `losetup -a`,
then build the stack. `lvm2` is already installed.
