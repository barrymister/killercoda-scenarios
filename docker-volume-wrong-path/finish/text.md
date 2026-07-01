# Nice work

A bind mount only helps if its destination is the exact path the process reads
from (nginx: `/usr/share/nginx/html`, Apache: `/usr/local/apache2/htdocs`).
`docker inspect ... .Mounts` shows Source -> Destination. Wrong destination =
the app quietly ignores your files, same as a Kubernetes volume mounted at the
wrong `mountPath`.
