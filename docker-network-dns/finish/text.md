# Nice work

Containers on the **default bridge** get no name-based DNS — you'd have to wire
them together by IP. On a **user-defined network** (`docker network create ...`)
Docker runs an embedded DNS server so containers reach each other by name. This
is exactly what Docker Compose does for you under the hood, and it's the Docker
analogue of a Kubernetes Service giving pods a stable name.
