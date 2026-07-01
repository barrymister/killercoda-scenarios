# Spot the bracket bug

Run it and read the error:

```
bash /root/check.sh
cat /root/check.sh
```{{exec}}

`[` is actually a **command** — it needs spaces around it and its arguments.
`[$COUNT -gt 3]` runs a command literally called `[5`. Fix the spacing:

```
sed -i 's/\[\$COUNT -gt 3\]/[ $COUNT -gt 3 ]/' /root/check.sh
bash /root/check.sh
cat /root/verdict.out
```{{exec}}

(Or open the file and add the spaces by hand.) Once `verdict.out` says `many`,
press **Check**.
