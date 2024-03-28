#!/bin/bash
# Create ServicePrincipal and manage azure resources
# You could use ServicePrincipal to manage azure resources other than loging with your credentials

SPN_Name=spn-tfbasics
SPN_Scope=/subscriptions/<subscription_name>

az ad sp create-for-rbac --name $SPN_Name --role Contributor --scopes $SPN_Scope