# Nice work

A pod can be `Running` yet `0/1` — readiness gates whether it receives traffic.
`describe pod` shows the probe failures in Events. Match the probe's port/path to
what the app actually serves.
