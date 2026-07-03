# Read the diagnostic, fix the config

```
cd /root/lab
terraform validate
```{{exec}}

You'll see two problems: the azurerm provider needs a **`features {}`** block, and
`var.location` is used but never declared. Fix both:

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

variable "location" {
  type    = string
  default = "eastus"
}

resource "azurerm_resource_group" "lab" {
  name     = "rg-lab"
  location = var.location
}
TF
```{{exec}}

Validate again:

```
terraform validate
```{{exec}}

When you see **"Success! The configuration is valid."**, press **Check**.
