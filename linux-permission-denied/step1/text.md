# Read the bits, add execute

Reproduce it, then look at why:

```
/root/deploy.sh
ls -l /root/deploy.sh
```{{exec}}

No `x` bit anywhere (`-rw-r-----`). Grant execute and run it:

```
chmod +x /root/deploy.sh
/root/deploy.sh
```{{exec}}

Confirm it did its job:

```
cat /root/deploy.done
```{{exec}}

Once the script has run, press **Check**.
