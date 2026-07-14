# Name resolves again

Name resolution follows the order set in `/etc/nsswitch.conf` — normally
`/etc/hosts` **before** DNS. A typo in a hosts entry fails silently: the wrong
name is defined, the right one just isn't found. Diagnose with `getent hosts
NAME`, which follows that real order, then inspect `/etc/hosts` and
`/etc/resolv.conf`. Tip: `dig NAME` queries DNS servers directly and ignores
`/etc/hosts`, so comparing `getent` and `dig` tells you which layer — local file
or DNS — is actually at fault.
