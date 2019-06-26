#Creating resource group

#az group create --resource-group JenkinsGroup -l uksouth

#Creating a virtual network wihtin our resource group

#az network vnet create -g JenkinsGroup -n JenkinsVirtualNetwork --address-prefixes 10.0.0.0/16 --subnet-name JenkinsSubnet --subnet-prefix 10.0.0.0/24

#Creating our subnets 

#az network vnet subnet create -g JenkinsGroup  --vnet-name JenkinsVirtualNetwork --name JenkinsSubnet --address-prefixes 10.0.0.0/24

#Creating the nsg

#az network nsg create -g JenkinsGroup -n JenkinsNSG

#Creating the rules in our nsg

#az network nsg rule create --resource-group JenkinsGroup --name SSH --priority 500 --nsg-name JenkinsNSG

#Selecting our ports

#az network nsg rule create -g JenkinsGroup --name SSH --destination-port-ranges 22 --nsg-name JenkinsNSG --priority 400

#Creating public ip

az network public-ip create --resource-group JenkinsGroup --name JenkinsIPbb --dns-name dnsnamebtwo --allocation-method Static
az network public-ip create --resource-group JenkinsGroup --name JenkinsIPcc --dns-name dnsnamecthree --allocation-method Static
az network public-ip create --resource-group JenkinsGroup --name JenkinsIPaa --dns-name dnsnamaone --allocation-method Static
az network nic create --resource-group JenkinsGroup --name JenkinsNICaa --vnet-name JenkinsVirtualNetwork --subnet JenkinsSubnet --network-security-group JenkinsNSG --public-ip-address JenkinsIPaa
az network nic create --resource-group JenkinsGroup --name JenkinsNICbb --vnet-name JenkinsVirtualNetwork --subnet JenkinsSubnet --network-security-group JenkinsNSG --public-ip-address JenkinsIPbb
az network nic create --resource-group JenkinsGroup --name JenkinsNICc --vnet-name JenkinsVirtualNetwork --subnet JenkinsSubnet --network-security-group JenkinsNSG --public-ip-address JenkinsIPcc

#creating the VM's

az vm create -g JenkinsGroup -n JenkinsHostVM --image UbuntuLTS --nics JenkinsNICaa --size Standard_B1ls --generate-ssh-keys

az vm create -g JenkinsGroup -n JenkinsSlaveVM --image UbuntuLTS --nics JenkinsNICbb --size Standard_B1ls --generate-ssh-keys

az vm create -g JenkinsGroup -n PythonServerVM --image UbuntuLTS --nics JenkinsNICc --size Standard_B1ls --generate-ssh-keys
