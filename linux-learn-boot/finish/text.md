# Boot & targets

A **target** is a system state made of units. `multi-user.target` is a normal
headless boot; `graphical.target` layers a GUI on top; `rescue.target` is a
single-user maintenance shell. `systemctl get-default` shows the boot default and
`systemctl set-default TARGET` changes it. To read logs, `journalctl -b` shows
everything since the last boot and `journalctl -b -1` shows the previous boot —
handy for diagnosing why a machine came up wrong.
