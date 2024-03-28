# 101 - Terraform Basics

## 1. Setup Terraform
Follow the Hashicorp [tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) on how to setup Terraform in your machine   

## 2. Connect to Azure 
Use Azure CLI to connect to Azure subscription <br>

`az login`

If you have multiple subscriptions and want to set a specific one as the default: <br>

`az account set -subscription "<subscriptionid>"`

## 3. Create Storage account to store Terraform State

Terraform state has to be stored in a storage account. The shell script available under scripts/createremote.sh creates a resource group, storage account and container. The script provides the storage account key as output. This is required to configure the Terraform backend. 

Go to terraform/providers.tf and update the values you provided in the shell script 

```
backend "azurerm" {
    resource_group_name  = "<resourcegroup_name>"
    storage_account_name = "<storageaccount_name>"
    container_name       = "<container_name>"
    key                  = "<storageAccountKey"
  }
```
## 4. Execute Terraform 

Now we have setup the Azure connection and created a backend to store the terraform state. The basic terraform code is available under `Terraform` folder. 

### main.tf
This terraform file creates the resource group
### network.tf
The terraform file creates the Virtual network and two subnets within the newly created resource group
### outputs.tf
This terraform file puts the output of the created resources, we can use these output variables in other terraform files
### providers.tf
This terraform file tells us to which provider we want to connect i.e., Azure. There are several other providers like the one mentioned here "random". This generates a random number, since this random will be used globally this is available in providers.tf

There is additional features which you can enable when using azurerm. This is configured here
```
provider "azurerm" {
  features {}
}
```



### a. Terraform init

`terraform init` - Initialize terraform which installs providers in your local machine under .terraform folder

### b. Terraform validate

`terraform validate`- This statement validates the configuration files in a directory. 

### c. Terraform plan

`terraform plan` - This provides a plan on which resources are created, updated and deleted

### d. Terraform apply

`terraform apply` - Executes the plan to create infrastructure on Azure


## 5. Terratest
Terratest is a Go library that makes it easier to write automated tests for your infrastructure code.

Follow the steps mentioned in the [Terratest website](https://terratest.gruntwork.io/docs/getting-started/quick-start/)  for quickstart or follow the presentation shared

### References

[Terraform for Azure](https://learn.microsoft.com/en-us/azure/developer/terraform/) 
[Terratest on Azure](https://github.com/gruntwork-io/terratest/tree/master/test/azure)