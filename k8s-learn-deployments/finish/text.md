# Deployments in one breath

`create deployment` declared the desired state, `scale` changed the replica
count, and `set image` + `rollout status` shipped a new version with zero
downtime. The Deployment's job is to make reality match what you asked for.
