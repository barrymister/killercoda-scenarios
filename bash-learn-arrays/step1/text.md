# Index arrays, reshape strings

Put it in a script that writes a file:

```
cat > /root/arr.sh <<'SH'
#!/bin/bash
fruits=(apple banana cherry)
echo "count=${#fruits[@]}"          # array length -> 3
echo "second=${fruits[1]}"          # index (0-based) -> banana
printf '%s\n' "count=${#fruits[@]}" "second=${fruits[1]}" > /root/arr.out
fruits+=(date)                       # append -> now 4 elements
echo "after_append=${#fruits[@]}"   # 4
name="Bench-Engine"
echo "lower=${name,,}"              # lowercase whole string
echo "cut=${name#Bench-}"          # strip 'Bench-' prefix
SH
bash /root/arr.sh
cat /root/arr.out
```{{exec}}

What each piece does:

- `${#fruits[@]}` — the array's **length** (element count).
- `${fruits[1]}` — the element at **index** 1 (arrays are 0-based, so `banana`).
- `fruits+=(date)` — **append** an element (watch `after_append` become `4`).
- `"${fruits[@]}"` — **all elements**, quoted, one word each (always quote it).
- String ops via parameter expansion: `${name,,}` lowercases, `${name^^}`
  uppercases, `${name#prefix}` strips a leading prefix, `${name%suffix}` strips a
  trailing suffix, and `${name/old/new}` replaces the first match.

Once `/root/arr.out` reads `count=3` then `second=banana`, press **Check**.
