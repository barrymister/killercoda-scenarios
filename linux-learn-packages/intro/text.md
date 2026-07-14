# Managing software on Debian/Ubuntu

On Debian and Ubuntu, software comes as `.deb` packages. Two tools work together:

- **apt** — the high-level manager. It downloads packages, resolves dependencies,
  and installs them: `apt-get update`, `apt-get install`, `apt-get remove`,
  `apt-get purge`.
- **dpkg** — the low-level database query tool for what's already installed:
  - `dpkg -s NAME` — status / details of a package
  - `dpkg -L NAME` — every file a package installed
  - `dpkg -S PATH` — which package owns a given file

On Fedora/RHEL the equivalents are `dnf` (high-level) and `rpm` (low-level).

You'll install the small `tree` utility, then inspect it with `dpkg`.
