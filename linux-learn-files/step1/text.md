# Look around, then make a file

Where are you, and what's here?

```
pwd
ls -la
```{{exec}}

Go into the project and explore the tree:

```
cd /root/project
ls -R
```{{exec}}

Read a file, and find files by name:

```
cat src/app.py
find . -name "*.md"
```{{exec}}

Now create your own note in the project folder:

```
echo "my notes" > /root/project/notes.txt
```{{exec}}

Once `/root/project/notes.txt` exists, press **Check**.
