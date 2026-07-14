# systemd services

A **unit file** in `/etc/systemd/system/` describes a service: `ExecStart` is the
command, `WantedBy=multi-user.target` makes `enable` hook it into boot. After
editing any unit run `systemctl daemon-reload`. `enable --now` enables **and**
starts in one step; `is-active` / `is-enabled` are the fast checks. `mask` goes
further than `disable` — it makes a unit impossible to start until you `unmask` it.
