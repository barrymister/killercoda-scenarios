# You compiled Bicep to ARM

You declared a resource in Bicep and `az bicep build` produced the ARM JSON Azure
actually deploys. Everything else — parameters, modules, more resources — builds
on this loop: **write `.bicep` → build → inspect the JSON.**
