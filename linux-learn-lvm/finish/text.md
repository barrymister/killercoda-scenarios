# LVM: PV, VG, LV

LVM stacks storage in three layers: **PVs** are real block devices, a **VG** pools
them together, and **LVs** are volumes carved out of the pool that you format and
mount. You build the stack with `pvcreate` → `vgcreate` → `lvcreate`, and inspect
it with `pvs` / `vgs` / `lvs`. The reason LVM exists is live growth:
`lvextend -L +100M -r` grows a logical volume and its filesystem in one command,
without unmounting anything.
