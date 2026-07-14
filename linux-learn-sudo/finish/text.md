# sudo, safely

Never edit `/etc/sudoers` directly. Use `visudo` (it syntax-checks before it saves)
or drop a rule into `/etc/sudoers.d/` at mode **440**. A single bad line in a
sudoers file locks everyone out of sudo, which is why `visudo -cf FILE` — a check
that validates without saving — is the safety net you run every time.
`NOPASSWD:ALL` trades security for convenience; omit `NOPASSWD` when you want sudo to
demand a password.
