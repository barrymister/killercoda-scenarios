# Keep config out of the image

Hard-coding settings into an image is painful. A **ConfigMap** holds key/value
config you can inject into Pods as env vars or files — so the same image runs
in dev, staging, and prod with different config.
