# Write three commands

```
cd /root/lab
```{{exec}}

Add the `az` command for each task below to `answers.sh` (one per line). Example
for the first — adapt the pattern for the others:

```
cat > answers.sh <<'ANS'
# 1) Create a resource group named rg-lab in eastus
az group create --name rg-lab --location eastus

# 2) Create a Linux (Ubuntu) VM named vm1 in rg-lab
az vm create --resource-group rg-lab --name vm1 --image Ubuntu2204 --admin-username azureuser --generate-ssh-keys

# 3) Assign the Reader role to a user at the rg-lab resource group scope
az role assignment create --assignee user@contoso.com --role Reader --resource-group rg-lab
ANS
```{{exec}}

Check your file:

```
cat answers.sh
```{{exec}}

When all three commands are present, press **Check**.
