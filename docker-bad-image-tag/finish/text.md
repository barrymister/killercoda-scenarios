# Nice work

A bad image reference (`ErrImagePull` in Kubernetes, `manifest unknown` here)
is almost always a wrong tag or repo name. The error text tells you which. Read
it, correct the tag, re-run. `docker pull <image>` on its own is a quick way to
prove a tag exists before you wire it into anything.
