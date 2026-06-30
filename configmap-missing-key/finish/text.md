# Nice work

`CreateContainerConfigError` means a referenced ConfigMap/Secret key is missing.
`describe pod` names the exact key. Create it, then roll the deployment so a new
pod picks it up.
