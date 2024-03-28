#!/bin/bash

#Make sure you're connected to azure environment before executing this script
# use az login - to login to the azure environment
# use az account set -subscription "<subscriptionid>"

#update the below variables

RESOURCE_GROUP_NAME=resourcegroup_name
STORAGE_ACCOUNT_NAME=storage_name
CONTAINER_NAME=container_name

# Create resource group
az group create --name $RESOURCE_GROUP_NAME --location westeurope

# Create storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

# Create blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
echo $ACCOUNT_KEY
export ARM_ACCESS_KEY=$ACCOUNT_KEY