# 101 - Terraform Basics

## 1. Setup Terraform
Follow the Hashicorp [tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on how to setup Terraform in your machine   

## 2. Connect to Azure 
Use Azure CLI to connect to Azure subscription <br>
`az login`

If you have multiple subscriptions and want to set a specific one as the default: <br>
`az account set -subscription "<subscriptionid>"`

## 3. Create Storage account to store Terraform State

Terraform state has to be stored in a storage account. The shell script available under scripts/createremote.sh creates a resource group, storage account and container. The script provides the storage account key. This is required to configure the Terraform backend. 

Go to terraform/providers.tf and update the key value 

```
backend "azurerm" {
    resource_group_name  = "<resourcegroup_name>"
    storage_account_name = "<storageaccount_name>"
    container_name       = "<container_name>"
    key                  = "<storageAccountKey"
  }
```
## 4. Execute Terraform 



### a. Terraform init

`terraform init`

### b. Terraform validate

`terraform validate`

### c. Terraform plan

`terraform plan`

### d. Terraform apply

`terraform apply`


## 5. Terratest
This 

##References

[Terraform for Azure](https://learn.microsoft.com/en-us/azure/developer/terraform/) 
