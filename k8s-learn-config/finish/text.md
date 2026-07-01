# Config, separated

The ConfigMap `app-config` holds settings independent of any image. Pods pull
values from it as env vars (what you did) or mounted files. Secrets work the
same way for sensitive values. Change the ConfigMap, roll the Pods, new config.
