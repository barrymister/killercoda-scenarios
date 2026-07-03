# Terraform that won't validate

You've inherited a broken `main.tf`. Run `terraform validate`, read the
diagnostic (it names the file, line, and what's wrong), and fix the config so it
validates. This one is missing the provider's required `features {}` block and
references an undeclared variable.
