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
  backend "azurerm" {
      resource_group_name  = "tfbasics"
      storage_account_name = "<storage_account_name>"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  
  # ServicePrinciple can also be used
  # subscription_id   = "<azure_subscription_id>"
  # tenant_id         = "<azure_subscription_tenant_id>"
  # client_id         = "<service_principal_appid>"
  # client_secret     = "<service_principal_password>"
  features {}
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "eastus"
}