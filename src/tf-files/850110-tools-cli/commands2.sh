# Execute the following in powershell.

cd ../../..

# cd into the directory.
# C:\Vivek\Trials\Tf\Az204\src\tf-files\840100-aks-nginx\commands.sh

cd ./src/tf-files/850110-tools-cli

$ResourceGroupName="kubernetes-grp"

$ResourceGroupLocation="North Europe"

$AksName="appcluster"

$AppName="dockerapp665544"

# 1. Create RG

az group create --name $ResourceGroupName --location $ResourceGroupLocation

az group list

# 2. Then create the cluster

az aks create --resource-group $ResourceGroupName --name $AksName --node-count 1 --enable-addons monitoring --generate-ssh-keys

# 3. If you don't have the kubectl tool installed locally, then install the CLI

az aks install-cli

# 4. Then download the credentials so that the kubectl tool can use the kubernetes cluster

az aks get-credentials --resource-group $ResourceGroupName --name $AksName --overwrite-existing --admin

kubectl cluster-info

# 5. To get the nodes in the cluster

kubectl get nodes

# 6. We can then deploy our application via the kubectl command

kubectl apply -f ./deployment.yml
kubectl apply -f service.yml

kubectl get pod

kubectl get deploy

kubectl get svc

# 7. We can delete the resource group

az group delete --name $ResourceGroupName --yes
