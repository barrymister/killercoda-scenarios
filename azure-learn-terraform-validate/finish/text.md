# Valid Terraform

`terraform init` pulled the azurerm provider and `terraform validate` confirmed
your HCL is sound — the `features {}` block is the one bit everyone forgets.
This is the author → init → validate loop you'd run before every plan/apply.
