# Read the bits, then grant execute

Look at the permissions (the `-rw-r--r--` column):

```
ls -l /root/run.sh
```{{exec}}

Try to run it — it fails, because there's no execute bit:

```
/root/run.sh
```{{exec}}

Add execute for everyone, confirm, and run it:

```
chmod +x /root/run.sh
ls -l /root/run.sh
/root/run.sh
```{{exec}}

Once the script has run, press **Check**.
