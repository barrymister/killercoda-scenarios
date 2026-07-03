# Valid again

Two classic azurerm mistakes: a missing `features {}` block and an undeclared
variable. `terraform validate` pointed at both. Adding the block and declaring
`variable "location"` made the config valid.
