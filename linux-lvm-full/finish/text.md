# Grown live — no downtime

That's the LVM payoff: you grew storage while the filesystem stayed mounted and
in use. No unmount, no reboot, no downtime.

The triage that gets you there:

- `df -h` names the full filesystem — the symptom.
- `vgs` / `vgdisplay` confirm there's free space in the volume group (`VFree` /
  `Free PE`) — the headroom that makes a live grow possible.
- `lvextend -r /dev/appvg/app` extends the logical volume **and** its filesystem
  in one step. The `-r` resizes the filesystem (`resize2fs` for ext4,
  `xfs_growfs` for XFS) so `df` actually reflects the new space.

What if the volume group itself is out of space? Then you add capacity first:
`pvcreate` a new physical volume (a new disk, partition, or loop image), then
`vgextend appvg <new-pv>` to fold it into the group — and now you have free
extents to `lvextend` into again. That layering is exactly why LVM exists.
