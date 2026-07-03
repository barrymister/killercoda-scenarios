# Declare a storage account

Move into the working folder:

```
cd /root/lab
```{{exec}}

Write a Bicep template that declares one storage account. Paste this whole block:

```
cat > main.bicep <<'BICEP'
param location string = resourceGroup().location

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'devbench${uniqueString(resourceGroup().id)}'
  location: location
  sku: { name: 'Standard_LRS' }
  kind: 'StorageV2'
}
BICEP
```{{exec}}

Now compile it to ARM JSON:

```
az bicep build -f main.bicep
```{{exec}}

That writes `main.json` next to your `.bicep`. Look at it:

```
head -20 main.json
```{{exec}}

When `main.json` exists, press **Check**.
