cd ../../..

# cd into the directory.
# C:\Vivek\Trials\Tf\Az204\src\tf-files\840100-aks-nginx\commands.sh

cd ./src/tf-files/850150-tools-arm

$ResourceGroupName="storage-trial-rg"

$ResourceGroupLocation="North Europe"

az group create --name $ResourceGroupName --location $ResourceGroupLocation

New-AzResourceGroupDeployment -ResourceGroupName $ResourceGroupName -TemplateFile template01.json

az group delete --name $ResourceGroupName --yes

