#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
mkdir -p /root/lab
if ! command -v az >/dev/null 2>&1; then
  curl -sL https://aka.ms/InstallAzureCLIDeb | bash >/dev/null 2>&1 || true
fi
az bicep install >/dev/null 2>&1 || true
# Broken on purpose: sku.name references an undeclared symbol `skuName`.
cat > /root/lab/main.bicep <<'BICEP'
param location string = resourceGroup().location

resource sa 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'devbench${uniqueString(resourceGroup().id)}'
  location: location
  sku: { name: skuName }
  kind: 'StorageV2'
}
BICEP
rm -f /root/lab/main.json
touch /root/.lab-ready
