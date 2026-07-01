# Data that outlives the container

The file lived in the `appdata` volume, not the container's own layer — so it
was still there after the first container was removed. Volumes are how databases
and uploads survive restarts and re-deploys. `-v name:/path` mounts one.
