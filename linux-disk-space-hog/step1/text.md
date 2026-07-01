# Find the hog, then remove it

Where's the space going? Summarise by folder, biggest last:

```
du -sh /root/app/* | sort -h
du -ah /root/app | sort -h | tail -5
```{{exec}}

Or hunt for large files directly:

```
find /root/app -type f -size +100M -exec ls -lh {} \;
```{{exec}}

It's `logs/debug.log`. Delete just that file (leave `app.conf` alone):

```
rm /root/app/logs/debug.log
du -sh /root/app
```{{exec}}

Once the giant log is gone, press **Check**.
