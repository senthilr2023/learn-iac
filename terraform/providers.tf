terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  #the key should ideally be placed in a keyvault or in a environment variable so that it is not written in the disk
    backend "azurerm" {
    resource_group_name  = "<resourcegroup_name>"
    storage_account_name = "<storageaccount_name>"
    container_name       = "<container_name>"
    key                  = "<storageAccountKey"
  }
}

provider "azurerm" {
  features {}
}

resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}
