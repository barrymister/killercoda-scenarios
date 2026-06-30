# Nice work

`OOMKilled` shows up as the container's **Last State** in `describe`. Either the
limit is too low or the app leaks. Raise the limit (or fix the leak) and confirm
it stops restarting.
