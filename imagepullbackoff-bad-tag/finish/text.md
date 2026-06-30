# Nice work

`ImagePullBackOff` almost always means the image name or tag is wrong, or the
registry needs auth. Your reflex: `describe pod` → read the Events → fix the
image with `kubectl set image` → confirm `Running`.
