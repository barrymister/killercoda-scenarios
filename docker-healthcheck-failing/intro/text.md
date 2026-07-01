# The container never reports healthy

`docker ps` shows the `web` container as `(unhealthy)`. The app itself is fine —
the *healthcheck* is checking the wrong thing, so orchestration keeps treating
it as down. Move to the next step.
