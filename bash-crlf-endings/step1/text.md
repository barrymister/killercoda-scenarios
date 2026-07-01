# Find the ^M, strip it

Run it and see the giveaway `^M`:

```
/root/build.sh
```{{exec}}

Make the carriage returns visible:

```
cat -A /root/build.sh
```{{exec}}

The `^M$` at each line end is `\r`. Strip it (dos2unix, or sed), then run:

```
sed -i 's/\r$//' /root/build.sh
/root/build.sh
cat /root/build.done
```{{exec}}

Once `/root/build.done` exists, press **Check**.
