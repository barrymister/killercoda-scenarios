# Ports, published

`-p 8080:80` told Docker to forward host `8080` to the container's `80`. The
left side is the host, the right side is inside the container — mixing them up
is the classic "why can't I reach it?" bug. `docker port` shows the live map.
