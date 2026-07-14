# "No space left on device" on /mnt/app

The application filesystem mounted at `/mnt/app` is full — writes are failing
with `No space left on device`. But this volume sits on LVM, and its volume
group still has free extents. That means you can grow the filesystem **live**,
without unmounting or rebooting.

Diagnose the shortage, confirm there's headroom in the volume group, then extend
the logical volume and its filesystem in one move.

> The physical volume is a loopback image file, so the whole LVM stack is
> simulated — safe to practise, no real disk required.
