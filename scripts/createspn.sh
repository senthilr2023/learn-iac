#!/bin/bash
# Create ServicePrincipal and manage azure resources
SPN_Name=spn-tfbasics
SPN_Scope=/subscriptions/d56646a0-1abb-4170-ac65-97c9dbe9d4f2

az ad sp create-for-rbac --name $SPN_Name --role Contributor --scopes $SPN_Scope