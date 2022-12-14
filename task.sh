#!/bin/bash
az group create -l eastus -n activity1 
az network vnet create -g activity1 -n net1 --address-prefixes 10.0.0.0/16 --location eastus
az network vnet subnet create --name web --resource-group activity1  --vnet-name net1 --address-prefixes 10.0.0.0/24
az network vnet subnet create --name app --resource-group activity1 --vnet-name net1 --address-prefixes 10.0.1.0/24
az network vnet subnet create --name db --resource-group activity1 --vnet-name net1 --address-prefixes 10.0.2.0/24
az network nsg create --name nsg1 -g activity1 -l eastus 
az network nsg rule create --name appnsg --nsg-name nsg1 --resource-group activity1 --priority 500 --access Allow --source-port-ranges 22 --protocol Tcp --direction Inbound --source-address-prefixes * 
az network nsg rule create --name dbnsg --nsg-name nsg1 --resource-group activity1 --priority 510 --access Allow --source-port-ranges 80  --protocol Tcp --direction Inbound --source-address-prefixes * 
az vm create --name vm1 -g activity1 --image UbuntuLTS --vnet-name net1 --subnet web --size Standard_B1s --public-ip-sku Standard --nsg nsg1 --location eastus --admin-username devops --admin-password Motherindia@123 --authentication-type password