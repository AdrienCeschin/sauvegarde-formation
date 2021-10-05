#!/bin/bash
​
# Create a resource group.
az group create --location westeurope --name tp1-adrienceschin
​
# Create a new virtual machine, this creates SSH keys if not present.
az vm create --resource-group tp1-adrienceschin --name vm-tp1-adrienceschin --image UbuntuLTS --ssh-key-value ~/.ssh/id_rsa.pub --custom-data cloud-init.txt
​
# Open port 80 to allow web traffic to host.
az vm open-port --port 80 --resource-group tp1-adrienceschin --name vm-tp1-adrienceschin