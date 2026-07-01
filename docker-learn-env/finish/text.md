# Config via env

`-e APP_ENV=prod` set an environment variable the app can read — no rebuild, no
code change. `printenv`/`env` inside the container confirm it. Twelve-factor apps
lean on this: same image everywhere, behavior driven by env.
