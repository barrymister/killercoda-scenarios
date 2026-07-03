# Write a resource group in Terraform

```
cd /root/lab
```{{exec}}

Create a minimal azurerm configuration. Note the required **`features {}`** block:

```
cat > main.tf <<'TF'
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "lab" {
  name     = "rg-lab"
  location = "eastus"
}
TF
```{{exec}}

Initialise (downloads the provider) and validate:

```
terraform init -input=false
terraform validate
```{{exec}}

When you see **"Success! The configuration is valid."**, press **Check**.
