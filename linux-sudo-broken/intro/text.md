# sudo stopped working

Someone dropped a new file into `/etc/sudoers.d/` and now **every** `sudo`
command fails with a parse error like `sudo: parse error in /etc/sudoers.d/...`.
sudo is down for the whole box. Find the broken rule and repair it.

You're already root here, so you can still edit the files directly.
