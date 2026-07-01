# grep, count, pipe, redirect

Find the error lines (status 500):

```
grep " 500 " /root/access.log
```{{exec}}

Count how many 404s there are — `grep` piped into `wc -l`:

```
grep " 404 " /root/access.log | wc -l
```{{exec}}

Now save all the server errors (500s) into a new file:

```
grep " 500 " /root/access.log > /root/errors.txt
cat /root/errors.txt
```{{exec}}

Once `/root/errors.txt` has the 500 lines, press **Check**.
