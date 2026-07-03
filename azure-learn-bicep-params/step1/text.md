# Add parameters and a secure input

```
cd /root/lab
```{{exec}}

Write a template that takes the storage name and SKU as **parameters** and a
secret as a **secure** parameter (no default):

```
cat > main.bicep <<'BICEP'
@description('Storage account name')
param storageName string

@allowed([ 'Standard_LRS', 'Standard_ZRS' ])
param skuName string = 'Standard_LRS'

@secure()
param appSecret string

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageName
  location: resourceGroup().location
  sku: { name: skuName }
  kind: 'StorageV2'
}

output secretLength int = length(appSecret)
BICEP
```{{exec}}

Lint and build it — this must report **no errors**:

```
az bicep lint -f main.bicep
az bicep build -f main.bicep
```{{exec}}

When it builds clean, press **Check**.
