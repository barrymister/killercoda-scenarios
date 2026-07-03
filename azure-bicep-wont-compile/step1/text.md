# Read the compiler, fix the template

```
cd /root/lab
az bicep build -f main.bicep
```{{exec}}

You'll get something like `Error BCP057: The name "skuName" does not exist in the
current context.` The template uses `skuName` but never declares it.

Fix it — either add a parameter, or use a literal. The clean fix is a parameter:

```
cat > main.bicep <<'BICEP'
param location string = resourceGroup().location
param skuName string = 'Standard_LRS'

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'devbench${uniqueString(resourceGroup().id)}'
  location: location
  sku: { name: skuName }
  kind: 'StorageV2'
}
BICEP
```{{exec}}

Rebuild — it should be silent (success):

```
az bicep build -f main.bicep && echo OK
```{{exec}}

When it builds clean, press **Check**.
