# A Bicep template that won't build

Someone left you a `main.bicep` that fails to compile. Your job: run the build,
read the `Error BCP...` message, and fix the template so `az bicep build` exits
clean. The compiler tells you the file, line, and column — learn to read it.
